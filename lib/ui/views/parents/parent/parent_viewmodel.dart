import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/alltimetable/alltimetable_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../auth/login/login_view.dart';
import '../../common/allevents/allevents_view.dart';

class ParentViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  String c = "all";
  List<String> a = ["all", "scholarship", "education", "function"];

  void allevent() {
    _navigationService.navigateWithTransition(const AlleventsView(),
        routeName: Routes.alleventsView,
        transitionStyle: Transition.rightToLeft);
  }

  void alltimetable() {
    _navigationService.navigateWithTransition(const AlltimetableView(),
        routeName: Routes.alleventsView,
        transitionStyle: Transition.rightToLeft);
  }

  void logout() {
    sharedpref.remove("auth");
    sharedpref.remove('name');
    sharedpref.remove('number');
    sharedpref.remove('email');
    sharedpref.remove('cat');
    sharedpref.remove('img');
    sharedpref.remove('deviceid');
    _navigationService.clearStackAndShow(Routes.loginView);
    _navigationService.replaceWithTransition(const LoginView(),
        routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
  }
}
