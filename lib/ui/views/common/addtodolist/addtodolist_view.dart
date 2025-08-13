import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'addtodolist_viewmodel.dart';

class AddtodolistView extends StackedView<AddtodolistViewModel> {
  AddtodolistView({Key? key, this.update = false, this.data}) : super(key: key);
  Map? data;
  bool update;

  @override
  Widget builder(
      BuildContext context,
      AddtodolistViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
        appBar: AppBar(
          title: text_helper(
            data: "Add To Do",
            fontWeight: FontWeight.bold,
            size: 16,
          ),
        ),
        body: SafeArea(
            child: ListView(
              children: [
                verticalSpaceSmall,
                text_view_helper(
                    hint: "Enter Title",
                    prefix: const Icon(Iconsax.text_italic),
                    controller: viewModel.title),
                text_view_helper(
                    hint: "Enter Description",
                    prefix: const Icon(Iconsax.document),
                    controller: viewModel.des),
                InkWell(
                  onTap: () => viewModel.selectDate(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: text_helper(
                      data: viewModel.date.text.isEmpty
                          ? "Select Date"
                          : viewModel.date.text,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                verticalSpaceSmall,
                update
                    ? button_helper(
                    onpress: () => viewModel.update(context, data!),
                    child: text_helper(data: "Update To do"))
                    : button_helper(
                    onpress: () => viewModel.add(context),
                    child: text_helper(data: "Add To do"))
              ],
            )));
  }

  @override
  void onViewModelReady(AddtodolistViewModel viewModel) {
    if (update) {
      viewModel.title.text = data!["title"];
      viewModel.des.text = data!["des"];
      viewModel.date.text = data!["date"];
    }
    super.onViewModelReady(viewModel);
  }

  @override
  AddtodolistViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddtodolistViewModel();
}
