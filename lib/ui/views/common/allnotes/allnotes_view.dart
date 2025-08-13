import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import 'allnotes_viewmodel.dart';

class AllnotesView extends StackedView<AllnotesViewModel> {
  const AllnotesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllnotesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: text_helper(
          data: "All Notes",
          fontWeight: FontWeight.bold,
          size: fontSize18,
        ),
      ),
      body: FutureBuilder(
        future: ApiHelper.allnotes(viewModel.sharedpref.readString("email")),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.toString() == '[]') {
              return Center(
                child: text_helper(data: "No Data"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return listdata(context, snapshot, index, viewModel);
                },
              );
            }
          } else if (snapshot.hasError) {
            return const Icon(Icons.error);
          } else {
            return displaysimpleprogress(context);
          }
        },
      ),
    );
  }

  Widget listdata(BuildContext context, AsyncSnapshot snapshot, int index,
      AllnotesViewModel viewModel) {
    return Container(
        width: screenWidth(context),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  color: getColorWithOpacity(black, 0.1))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            text_helper(
              data: snapshot.data[index]['title'],
              fontWeight: FontWeight.bold,
            ),
            text_helper(
              data: snapshot.data[index]['des'],
              size: fontSize10,
            ),
            viewModel.sharedpref.readString("email") !=
                    snapshot.data[index]['uid']
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      button_helper(
                          onpress: () async {
                            displayprogress(context);
                            await ApiHelper.deletenotes(
                                snapshot.data[index]['_id'], context);
                            hideprogress(context);
                            viewModel.notifyListeners();
                          },
                          child: text_helper(data: "Delete")),
                      button_helper(
                          onpress: () => viewModel.event(snapshot.data[index]),
                          child: text_helper(data: "update")),
                    ],
                  ),
          ],
        ));
  }

  @override
  AllnotesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AllnotesViewModel();
}
