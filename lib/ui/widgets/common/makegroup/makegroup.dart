import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'makegroup_model.dart';

class Makegroup extends StackedView<MakegroupModel> {
  const Makegroup({super.key});

  @override
  Widget builder(
    BuildContext context,
    MakegroupModel viewModel,
    Widget? child,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpaceSmall,
        text_helper(
            data: "Make Group", size: fontSize24, fontWeight: FontWeight.bold),
        verticalSpaceSmall,
        Container(
          width: screenWidthCustom(context, 0.25),
          height: screenWidthCustom(context, 0.25),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(2, 2),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: getColorWithOpacity(black, 0.2))
              ],
              border: Border.all(
                  width: 3,
                  // color: kcDarkGreyColor,
                  strokeAlign: BorderSide.strokeAlignOutside)),
          child: InkWell(
            onTap: () => viewModel.pic(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: viewModel.image == null
                  ? const Icon(
                      Icons.person,
                      size: 80,
                    )
                  : Image.file(
                      viewModel.image!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        text_view_helper(hint: "Enter Title", controller: viewModel.title),
        verticalSpaceSmall,
        button_helper(
            onpress: () => viewModel.groups(context),
            width: screenWidth(context),
            child: text_helper(data: "Make Group")),
        verticalSpaceSmall,
      ],
    );
  }

  @override
  MakegroupModel viewModelBuilder(
    BuildContext context,
  ) =>
      MakegroupModel();
}
