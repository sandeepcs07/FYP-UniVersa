import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/common/apihelper/apihelper.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../chating/chating_view.dart';

class AllchatViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  void move(String idd, String did) {
    _navigationService.navigateWithTransition(
        ChatingView(
          id: idd,
          did: did,
        ),
        routeName: Routes.chatingView,
        transitionStyle: Transition.rightToLeft);
  }

  void asre(String status, String id) {
    ApiHelper.chatstatus(id, status);
    _navigationService.back();
    _navigationService.back();
  }
}
