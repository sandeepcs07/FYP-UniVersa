import 'package:stacked/stacked.dart';
import 'package:unievents/app/app.locator.dart';
import 'package:unievents/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/admins/admin/admin_view.dart';
import 'package:unievents/ui/views/auth/login/login_view.dart';

import '../../../services/sharedpref_service.dart';
import '../parents/parent/parent_view.dart';
import '../students/student/student_view.dart';
import '../teachers/teacher/teacher_view.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedpref = locator<SharedprefService>();

  Future runStartupLogic() async {
    _sharedpref.initialize();
    await Future.delayed(const Duration(seconds: 5));
    if (_sharedpref.readString("auth") == "true") {
      String cat = _sharedpref.readString("cat");
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
      } else if (cat == "admin") {
        _navigationService.clearStackAndShow(Routes.adminView);
        _navigationService.replaceWithTransition(const AdminView(),
            routeName: Routes.adminView,
            transitionStyle: Transition.rightToLeft);
      } else {
        _navigationService.clearStackAndShow(Routes.studentView);
        _navigationService.replaceWithTransition(const StudentView(),
            routeName: Routes.studentView,
            transitionStyle: Transition.rightToLeft);
      }
    } else {
      _navigationService.replaceWithTransition(const LoginView(),
          routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
    }
  }
}
