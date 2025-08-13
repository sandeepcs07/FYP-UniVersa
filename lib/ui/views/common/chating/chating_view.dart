import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'chating_viewmodel.dart';

class ChatingView extends StackedView<ChatingViewModel> {
  ChatingView({Key? key, required this.id, required this.did})
      : super(key: key);
  String id, did;

  @override
  Widget builder(
    BuildContext context,
    ChatingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: white),
        title: text_helper(
          data: "Chat",
          color: white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ApiHelper.allchatbyid(id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['c'].toString() == '[]') {
                      return const Center(
                        child: Text("No Data"),
                      );
                    } else {
                      List l = List.of(snapshot.data['c']).reversed.toList();
                      return ListView.builder(
                        itemCount: l.length,
                        reverse: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: l[index]['sendby'] ==
                                    viewModel.sharedpref.readString("email")
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: l[index]['sendby'] ==
                                          viewModel.sharedpref
                                              .readString("email")
                                      ? getColorWithOpacity(Colors.green, 0.3)
                                      : getColorWithOpacity(Colors.amber, 0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                      future:
                                          ApiHelper.findone(l[index]['sendby']),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          return text_helper(
                                            data: snapshot.data['name']
                                                .toString(),
                                            color: black,
                                            size: fontSize10,
                                            textAlign: TextAlign.start,
                                          );
                                        } else if (snapshot.hasError) {
                                          return const Icon(
                                            Icons.error,
                                            color: black,
                                          );
                                        } else {
                                          return displaysimpleprogress(context);
                                        }
                                      },
                                    ),
                                    text_helper(
                                      data: l[index]['mess'].toString(),
                                      size: fontSize12,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.start,
                                    ),
                                    text_helper(
                                      data: l[index]['date']
                                          .toString()
                                          .substring(0, 15),
                                      size: fontSize10,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                )),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: screenWidth(context),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: text_view_helper(
                            hint: "Enter Message",
                            prefix: const Icon(Icons.chat),
                            controller: viewModel.chat)),
                    horizontalSpaceTiny,
                    InkWell(
                      onTap: () async {
                        await ApiHelper.addchat(
                            id,
                            {
                              "sendby":
                                  viewModel.sharedpref.readString("email"),
                              "mess": viewModel.chat.text,
                              "date": DateTime.now().toString()
                            },
                            did);
                        viewModel.chat.clear();
                        viewModel.notifyListeners();
                      },
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: getColorWithOpacity(
                                Theme.of(context).primaryColorLight, 0.4),
                          ),
                          child: const Icon(Icons.arrow_forward_ios)),
                    ),
                    horizontalSpaceTiny,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  ChatingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatingViewModel();
}
