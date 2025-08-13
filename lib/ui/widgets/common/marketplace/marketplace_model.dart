import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/addmarketplace/addmarketplace_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';

class MarketplaceModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  Future<void> event(Map data, bool update) async {
    await _navigationService.navigateWithTransition(
        AddmarketplaceView(
          update: update,
          data: data,
        ),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
    notifyListeners();
  }
}
