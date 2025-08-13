import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/services/fire_service.dart';
import 'package:unievents/ui/common/apihelper/apihelper.dart';
import 'package:unievents/ui/common/customwidget/snakbar_helper.dart';
import 'package:unievents/ui/views/auth/singup/singup_view.dart';
import 'package:unievents/ui/views/parents/parent/parent_view.dart';
import 'package:unievents/ui/views/students/student/student_view.dart';
import 'package:unievents/ui/views/teachers/teacher/teacher_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../admins/admin/admin_view.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _firebase = locator<FireService>();
  final _sharedpref = locator<SharedprefService>();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (email.text.isEmpty || pass.text.isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else if (!EmailValidator.validate(email.text)) {
      show_snackbar(context, "Enter correct email");
    } else if (email.text == "admin@admin.com" && pass.text == "admin") {
      _sharedpref.setString('email', email.text);
      _sharedpref.setString('name', "admin");
      _sharedpref.setString('cat', "admin");
      _navigationService.clearStackAndShow(Routes.adminView);
      _navigationService.replaceWithTransition(const AdminView(),
          routeName: Routes.adminView, transitionStyle: Transition.rightToLeft);
    } else {
      try {
        displayprogress(context);
        UserCredential credential = await _firebase.auth
            .signInWithEmailAndPassword(email: email.text, password: pass.text);
        if (credential.user!.emailVerified) {
        var result = _firebase.messaging.getToken().then((value) {
          return ApiHelper.login(
              email.text, pass.text, value.toString(), context);
        });
        result.then((value) {
          String cat = value['cat'] ?? "";

          _sharedpref.setString('name', value['name']);
          _sharedpref.setString('number', value['number']);
          _sharedpref.setString('email', value['email']);
          _sharedpref.setString('cat', cat);
          _sharedpref.setString('img', value['img']);
          _sharedpref.setString('deviceid', value['img']);

          _sharedpref.setString("auth", 'true');
          hideprogress(context);

          if (cat == 'Parent') {
            _navigationService.clearStackAndShow(Routes.parentView);
            _navigationService.replaceWithTransition(const ParentView(),
                routeName: Routes.parentView,
                transitionStyle: Transition.rightToLeft);
          } else if (cat == "Teacher") {
            _navigationService.clearStackAndShow(Routes.teacherView);
            _navigationService.replaceWithTransition(const TeacherView(),
                routeName: Routes.teacherView,
                transitionStyle: Transition.rightToLeft);
          } else {
            _navigationService.clearStackAndShow(Routes.studentView);
            _navigationService.replaceWithTransition(const StudentView(),
                routeName: Routes.studentView,
                transitionStyle: Transition.rightToLeft);
          }
        });
        } else {
          hideprogress(context);
          show_snackbar(context, "Email Not Verified");
        }
      } on FirebaseAuthException catch (e) {
        hideprogress(context);
        if (e.code == 'wrong-password') {
          show_snackbar(context, 'The password provided is wrong');
        } else if (e.code == 'user-not-found') {
          show_snackbar(context, 'No user found for that email');
        } else {
          show_snackbar(context, "try again later");
        }
      }
    }
  }

  void singup() {
    _navigationService.navigateWithTransition(const SingupView(),
        routeName: Routes.singupView, transitionStyle: Transition.rightToLeft);
  }

  Future<void> forgetpassword(BuildContext context) async {
    if (email.text.isEmpty) {
      show_snackbar(context, "Fill Email");
    } else {
      await _firebase.auth.sendPasswordResetEmail(email: email.text);
      show_snackbar(context, "Forget Password Mail has been send");
    }
  }
}
