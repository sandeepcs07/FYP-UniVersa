import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/customwidget/button_helper.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import 'allchat_viewmodel.dart';

class AllchatView extends StackedView<AllchatViewModel> {
  const AllchatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllchatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: const IconThemeData(color: white),
          title: text_helper(
            data: "All Chat",
            color: white,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: FutureBuilder(
          future:
              ApiHelper.allchatbydid(viewModel.sharedpref.readString("email")),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.toString() == '[]') {
                return const SizedBox.shrink();
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () async {
                        if (snapshot.data[index]['status'] == "true") {
                          viewModel.move(snapshot.data[index]['_id'],
                              snapshot.data[index]['did']);
                        } else {
                          await aspect(
                              context, viewModel, snapshot.data[index]['_id']);
                          viewModel.notifyListeners();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder(
                              future: ApiHelper.findone(
                                  snapshot.data[index]['uid']),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot2) {
                                if (snapshot2.hasData) {
                                  return text_helper(
                                    data: snapshot2.data['name'].toString(),
                                    size: fontSize14,
                                    fontWeight: FontWeight.bold,
                                  );
                                } else if (snapshot2.hasError) {
                                  return const Icon(
                                    Icons.error,
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                            text_helper(
                                data: snapshot.data[index]['date']
                                    .toString()
                                    .substring(0, 10),
                                size: fontSize10),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } else if (snapshot.hasError) {
              return const Icon(
                Icons.error,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }

  Future<void> aspect(
      BuildContext context, AllchatViewModel viewModel, String id) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpaceSmall,
              text_helper(
                  data: "Aspect",
                  size: fontSize24,
                  fontWeight: FontWeight.bold),
              verticalSpaceMedium,
              button_helper(
                  onpress: () => viewModel.asre("true", id),
                  width: screenWidth(context),
                  child: text_helper(data: "Aspect")),
              button_helper(
                  onpress: () => viewModel.asre("false", id),
                  width: screenWidth(context),
                  child: text_helper(data: "Reject")),
              verticalSpaceSmall,
            ],
          ),
        ));
      },
    );
  }

  @override
  AllchatViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AllchatViewModel();
}
