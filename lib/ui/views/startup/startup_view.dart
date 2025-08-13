import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/app_colors.dart';
import 'package:unievents/ui/common/customwidget/text_helper.dart';
import 'package:unievents/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/login.svg",
                width: screenWidthCustom(context, 0.5),
                height: screenWidthCustom(context, 0.5),
                color: white,
              ),
              verticalSpaceLarge,
              text_helper(
                data: "UniVersa",
                fontWeight: FontWeight.bold,
                size: fontSize20,
                color: white,
              ),
              verticalSpaceSmall,
              const CircularProgressIndicator(
                color: white,
                strokeWidth: 10,
              )
            ],
          ),
        )));
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
