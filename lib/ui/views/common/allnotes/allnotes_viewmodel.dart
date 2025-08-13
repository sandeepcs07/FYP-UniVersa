import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/addnotes/addnotes_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';

class AllnotesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  Future<void> event(Map data) async {
    await _navigationService.navigateWithTransition(
        AddnotesView(
          update: true,
          data: data,
        ),
        routeName: Routes.addnotesView,
        transitionStyle: Transition.rightToLeft);
    notifyListeners();
  }
}
