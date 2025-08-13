import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../addevents/addevents_view.dart';

class AlleventsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  String c = "all";
  List<String> a = ["all", "scholarship", "education", "function"];

  void event(Map data) {
    _navigationService.navigateWithTransition(
        AddeventsView(
          update: true,
          data: data,
        ),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
  }
}
