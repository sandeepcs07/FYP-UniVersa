import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/addtimetable/addtimetable_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';

class AlltimetableViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  void event(Map data) {
    _navigationService.navigateWithTransition(
        AddtimetableView(
          update: true,
          data: data,
        ),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
  }
}
