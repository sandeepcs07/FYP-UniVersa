import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/app_colors.dart';
import 'package:unievents/ui/common/customwidget/text_helper.dart';
import 'package:unievents/ui/common/ui_helpers.dart';

import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import 'todolist_viewmodel.dart';

class TodolistView extends StackedView<TodolistViewModel> {
  const TodolistView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TodolistViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: text_helper(data: "Todo List", fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: ApiHelper.alltodolist(),
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
                  if (snapshot.data[index]['uid'] ==
                      viewModel.sharedpref.readString("email")) {
                    return listData(viewModel, context, snapshot, index);
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            }
          } else if (snapshot.hasError) {
            return const Icon(Icons.error);
          } else {
            return displaysimpleprogress(context);
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => viewModel.event({}, false),
      ),
    );
  }

  Widget listData(TodolistViewModel viewModel, BuildContext context,
      AsyncSnapshot snapshot, int index) {
    final data = snapshot.data[index];
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: getColorWithOpacity(Colors.black, 0.1),
                  offset: const Offset(1, 1),
                  spreadRadius: 2,
                  blurRadius: 2)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            text_helper(data: data['title'], fontWeight: FontWeight.bold),
            const Divider(),
            text_helper(data: data['des']),
            const Divider(),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                button_helper(
                    onpress: () => viewModel.event(data, true),
                    child: text_helper(data: "Update")),
                button_helper(
                    onpress: () =>
                        viewModel.deletetodolist(data["_id"], context),
                    child: text_helper(data: "Delete")),
              ],
            ),
          ],
        ));
  }

  @override
  TodolistViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TodolistViewModel();
}
