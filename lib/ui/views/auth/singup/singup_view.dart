import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import 'singup_viewmodel.dart';

class SingupView extends StackedView<SingupViewModel> {
  const SingupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SingupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          verticalSpaceMedium,
          text_helper(
            data: "Welcome to UniVersa",
            fontWeight: FontWeight.bold,
            size: fontSize20,
          ).animate(delay: 500.milliseconds).fade().moveY(begin: 50, end: 0),
          text_helper(
            data: "Let's Sign up",
            size: fontSize20,
          ).animate(delay: 700.milliseconds).fade().moveY(begin: 50, end: 0),
          verticalSpaceLarge,
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
          ).animate(delay: 900.milliseconds).fade().moveY(begin: 50, end: 0),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cat(context, viewModel, "Parent", "assets/par.svg"),
              cat(context, viewModel, "Teacher", "assets/teac.svg"),
              cat(context, viewModel, "Student", "assets/stu.svg"),
            ],
          ).animate(delay: 1100.milliseconds).fade().moveY(begin: 50, end: 0),
          verticalSpaceTiny,
          text_view_helper(
                  hint: "Enter your name",
                  prefix: const Icon(Iconsax.profile_2user),
                  isError: true,
                  controller: viewModel.name)
              .animate(delay: 1300.milliseconds)
              .fade()
              .moveY(begin: 50, end: 0),
          text_view_helper(
                  hint: "Enter your number",
                  textInputType: TextInputType.number,
                  maxlength: 11,
                  isError: true,
                  prefix: const Icon(Iconsax.call),
                  controller: viewModel.number)
              .animate(delay: 1500.milliseconds)
              .fade()
              .moveY(begin: 50, end: 0),
          text_view_helper(
                  hint: "Enter your email",
                  textInputType: TextInputType.emailAddress,
                  prefix: const Icon(Iconsax.message),
                  isError: true,
                  controller: viewModel.email)
              .animate(delay: 1700.milliseconds)
              .fade()
              .moveY(begin: 50, end: 0),
          text_view_helper(
                  hint: "Enter your password",
                  prefix: const Icon(Iconsax.password_check),
                  obsecure: true,
                  isError: true,
                  controller: viewModel.pass)
              .animate(delay: 1900.milliseconds)
              .fade()
              .moveY(begin: 50, end: 0),
          text_view_helper(
                  hint: "Enter your password again",
                  prefix: const Icon(Iconsax.password_check),
                  obsecure: true,
                  isError: true,
                  controller: viewModel.conpass)
              .animate(delay: 2100.milliseconds)
              .fade()
              .moveY(begin: 50, end: 0),
          verticalSpaceMedium,
          button_helper(
                  onpress: () => viewModel.signup(context),
                  child: text_helper(data: "Sign up"))
              .animate(delay: 2300.milliseconds)
              .fade()
              .moveY(begin: 50, end: 0),
          verticalSpaceTiny,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              text_helper(
                data: "Already Have Account? ",
                size: fontSize12,
              )
                  .animate(delay: 2500.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0),
              InkWell(
                onTap: () => viewModel.login(),
                child: text_helper(
                  data: "Sign In",
                  size: fontSize12,
                  color: Theme.of(context).primaryColor,
                ),
              )
                  .animate(delay: 2500.milliseconds)
                  .fade()
                  .moveY(begin: 50, end: 0),
            ],
          ),
          verticalSpaceLarge,
        ],
      ),
    )));
  }

  Widget cat(BuildContext context, SingupViewModel viewModel, String title,
      String img) {
    return InkWell(
      onTap: () {
        viewModel.cat = title;
        viewModel.notifyListeners();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 3,
                color: viewModel.cat == title
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(2, 2),
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: viewModel.cat == title
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight)
            ],
            color: Theme.of(context).scaffoldBackgroundColor),
        child: Column(
          children: [
            SvgPicture.asset(
              img,
              width: screenWidthCustom(context, 0.2),
              height: screenWidthCustom(context, 0.2),
            ),
            verticalSpaceTiny,
            text_helper(
              data: title,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }

  @override
  SingupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingupViewModel();
}
