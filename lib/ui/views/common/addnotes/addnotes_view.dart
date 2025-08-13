import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'addnotes_viewmodel.dart';

class AddnotesView extends StackedView<AddnotesViewModel> {
  AddnotesView({Key? key, this.update = false, this.data}) : super(key: key);
  Map? data;
  bool update;

  @override
  Widget builder(
    BuildContext context,
    AddnotesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: text_helper(
            data: "Add Notes",
            fontWeight: FontWeight.bold,
            size: 16,
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            verticalSpaceSmall,
            text_view_helper(
                hint: "Enter title",
                prefix: const Icon(Iconsax.designtools),
                controller: viewModel.title),
            text_view_helper(
                hint: "Enter des",
                prefix: const Icon(Iconsax.designtools),
                controller: viewModel.des),
            verticalSpaceSmall,
            update
                ? button_helper(
                    onpress: () => viewModel.update(context, data!),
                    child: text_helper(data: "Update Notes"))
                : button_helper(
                    onpress: () => viewModel.add(context),
                    child: text_helper(data: "Add Notes"))
          ],
        )));
  }

  @override
  void onViewModelReady(AddnotesViewModel viewModel) {
    if (update) {
      viewModel.title.text = data!["title"];
      viewModel.des.text = data!["des"];
    }
    super.onViewModelReady(viewModel);
  }

  @override
  AddnotesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddnotesViewModel();
}
