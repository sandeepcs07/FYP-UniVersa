import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/chating/chating_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';

class UsersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  Future<void> chat(String did, String status, BuildContext context) async {
    Map c = await ApiHelper.registerchat(
        sharedpref.readString("email"), did, status);
    if (c['status']) {
      if (c['astatus'] == "false") {
        _navigationService.navigateWithTransition(
            ChatingView(
              id: c['message'],
              did: c['did'],
            ),
            routeName: Routes.chatingView,
            transitionStyle: Transition.rightToLeft);
      } else {
        show_snackbar(context, "Wait for approval");
      }
    }
  }
}
