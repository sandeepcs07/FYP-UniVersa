import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/students/users/users_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../views/common/chating/chating_view.dart';

class ChatsModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  void user(String cat) {
    _navigationService.navigateWithTransition(
        UsersView(
          cat: cat,
        ),
        routeName: Routes.teacherView,
        transitionStyle: Transition.rightToLeft);
  }

  Future<void> chat(String did, BuildContext context) async {
    Map c = await ApiHelper.registerchat(did, did, "true");
    if (c['status']) {
      if (c['astatus'] == "true") {
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

  void move(String idd, String did) {
    _navigationService.navigateWithTransition(
        ChatingView(
          id: idd,
          did: did,
        ),
        routeName: Routes.chatingView,
        transitionStyle: Transition.rightToLeft);
  }
}
