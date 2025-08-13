import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:unievents/ui/common/customwidget/button_helper.dart';
import 'package:unievents/ui/common/customwidget/text_helper.dart';
import 'package:unievents/ui/common/customwidget/text_view_helper.dart';

import '../../../common/ui_helpers.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        verticalSpaceMedium,
        text_helper(
          data: "Welcome to UniVersa",
          fontWeight: FontWeight.bold,
          size: fontSize20,
        ).animate(delay: 500.milliseconds).fade().moveY(begin: 50, end: 0),
        text_helper(
          data: "Let's Login",
          size: fontSize20,
        ).animate(delay: 700.milliseconds).fade().moveY(begin: 50, end: 0),
        verticalSpaceLarge,
        SvgPicture.asset(
          "assets/login.svg",
          width: screenWidthCustom(context, 0.5),
          height: screenWidthCustom(context, 0.5),
        ).animate(delay: 900.milliseconds).fade().moveY(begin: 50, end: 0),
        verticalSpaceLarge,
        text_view_helper(
                hint: "Enter your email",
                prefix: const Icon(Iconsax.message),
                isError: true,
                controller: viewModel.email)
            .animate(delay: 1100.milliseconds)
            .fade()
            .moveY(begin: 50, end: 0),
        text_view_helper(
                hint: "Enter your password",
                prefix: const Icon(Iconsax.password_check),
                obsecure: true,
                isError: true,
                controller: viewModel.pass)
            .animate(delay: 1300.milliseconds)
            .fade()
            .moveY(begin: 50, end: 0),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => viewModel.forgetpassword(context),
              child: text_helper(
                data: "Forget Password",
                size: fontSize12,
              ),
            ),
          ),
        ).animate(delay: 1400.ms).fade().moveY(begin: 100, end: 0),
        verticalSpaceMedium,
        button_helper(
                onpress: () => viewModel.login(context),
                child: text_helper(data: "Login"))
            .animate(delay: 1500.milliseconds)
            .fade()
            .moveY(begin: 50, end: 0),
        verticalSpaceTiny,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            text_helper(
              data: "Don't Have Account? ",
              size: fontSize12,
            ).animate(delay: 1700.milliseconds).fade().moveY(begin: 50, end: 0),
            InkWell(
              onTap: () => viewModel.singup(),
              child: text_helper(
                data: "Register",
                color: Theme.of(context).primaryColor,
                size: fontSize12,
              ),
            ).animate(delay: 1700.milliseconds).fade().moveY(begin: 50, end: 0),
          ],
        )
      ],
    )));
  }

  Future<void> permission(LoginViewModel viewModel) async {
    await Permission.notification.request();
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) => permission(viewModel);

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
