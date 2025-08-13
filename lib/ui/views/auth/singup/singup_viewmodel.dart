import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/services/fire_service.dart';
import 'package:unievents/ui/common/apihelper/apihelper.dart';
import 'package:unievents/ui/common/apihelper/firebsaeuploadhelper.dart';

import '../../../../app/app.locator.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';

class SingupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebase = locator<FireService>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conpass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();

  String cat = "";

  File? image;
  Future<void> pic() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> signup(BuildContext context) async {
    if (email.text.isEmpty ||
        pass.text.isEmpty ||
        conpass.text.isEmpty ||
        name.text.isEmpty ||
        number.text.isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else if (pass.text != conpass.text) {
      show_snackbar(context, "Password do not match");
    } else if (!EmailValidator.validate(email.text)) {
      show_snackbar(context, "Enter correct email");
    } else if (image == null) {
      show_snackbar(context, "select Image");
    } else if (cat == "") {
      show_snackbar(context, "select Category");
    } else if (number.text.length != 11) {
      show_snackbar(context, "enter correct number");
    } else {
      try {
        displayprogress(context);
        UserCredential userCredential = await _firebase.auth
            .createUserWithEmailAndPassword(
                email: email.text, password: pass.text);
        await userCredential.user!.sendEmailVerification();

        String url = await FirebaseHelper.uploadFile(image, number.text);
        var result = _firebase.messaging.getToken().then((value) {
          return ApiHelper.registration(name.text, number.text, url, email.text,
              pass.text, cat, value.toString(), context);
        });
        result.then((value) {
          hideprogress(context);
          cleardata();
          _navigationService.back();
        });
      } on FirebaseAuthException catch (e) {
        hideprogress(context);
        if (e.code == 'weak-password') {
          show_snackbar(context, 'The password provided is too weak');
        } else if (e.code == 'email-already-in-use') {
          show_snackbar(context, 'The account already exists for that email.');
        } else {
          show_snackbar(context, "try again later");
        }
      }
    }
  }

  void cleardata() {
    name.clear();
    number.clear();
    email.clear();
    pass.clear();
    conpass.clear();
  }

  void showd(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: text_helper(
                data: "Success Full Registration",
                fontWeight: FontWeight.bold,
                size: fontSize20),
            content: text_helper(data: "Verify your email and login"),
            actions: [
              button_helper(
                  onpress: () => login(), child: text_helper(data: "Done"))
            ],
          );
        });
  }

  void login() {
    _navigationService.back();
  }
}
