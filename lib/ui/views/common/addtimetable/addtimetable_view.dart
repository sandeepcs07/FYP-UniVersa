import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'addtimetable_viewmodel.dart';

class AddtimetableView extends StackedView<AddtimetableViewModel> {
  AddtimetableView({Key? key, this.update = false, this.data})
      : super(key: key);
  Map? data;
  bool update;

  @override
  Widget builder(
    BuildContext context,
    AddtimetableViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
          title: text_helper(
            data: "Add Time Table",
            fontWeight: FontWeight.bold,
            size: 16,
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            verticalSpaceSmall,
            update
                ? CachedNetworkImage(
                    imageUrl: viewModel.img,
                    imageBuilder: (context, imageProvider) => Container(
                      width: screenWidth(context),
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        displaysimpleprogress(context),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                    ),
                  )
                : const SizedBox.shrink(),
            verticalSpaceSmall,
            Center(
              child: InkWell(
                onTap: () => viewModel.pic(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: viewModel.image == null
                      ? const Icon(
                          Iconsax.additem,
                          size: 80,
                        )
                      : Image.file(
                          viewModel.image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            verticalSpaceSmall,
            update
                ? button_helper(
                    onpress: () => viewModel.update(context, data!),
                    child: text_helper(data: "Update Time Table"))
                : button_helper(
                    onpress: () => viewModel.add(context),
                    child: text_helper(data: "Add Time Table"))
          ],
        )));
  }

  @override
  void onViewModelReady(AddtimetableViewModel viewModel) {
    if (update) {
      viewModel.img = data!["img"];
    }
    super.onViewModelReady(viewModel);
  }

  @override
  AddtimetableViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddtimetableViewModel();
}
