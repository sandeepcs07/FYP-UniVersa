import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'addcarpool_viewmodel.dart';

class AddcarpoolView extends StackedView<AddcarpoolViewModel> {
  AddcarpoolView({Key? key, this.update = false, this.data}) : super(key: key);
  Map? data;
  bool update;

  @override
  Widget builder(
    BuildContext context,
    AddcarpoolViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: text_helper(
            data: "Add Carpool",
            fontWeight: FontWeight.bold,
            size: 16,
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            verticalSpaceSmall,
            text_view_helper(
                hint: "Enter Destination",
                prefix: const Icon(Iconsax.location),
                controller: viewModel.to),
            text_view_helper(
                hint: "Enter From Location",
                prefix: const Icon(Iconsax.location),
                controller: viewModel.from),
            text_view_helper(
                hint: "Enter Number of Seats",
                textInputType: TextInputType.number,
                prefix: const Icon(Iconsax.courthouse),
                controller: viewModel.seats),
            text_view_helper(
                hint: "Enter Charges",
                textInputType: TextInputType.number,
                prefix: const Icon(Iconsax.moneys),
                controller: viewModel.charges),
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
                    child: text_helper(data: "Update Carpool"))
                : button_helper(
                    onpress: () => viewModel.add(context),
                    child: text_helper(data: "Add Carpool"))
          ],
        )));
  }

  @override
  void onViewModelReady(AddcarpoolViewModel viewModel) {
    if (update) {
      viewModel.to.text = data!["to"];
      viewModel.from.text = data!["form"];
      viewModel.seats.text = data!["seats"];
      viewModel.charges.text = data!["charges"];
      viewModel.date.text = data!["date"];
    }
    super.onViewModelReady(viewModel);
  }

  @override
  AddcarpoolViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddcarpoolViewModel();
}
