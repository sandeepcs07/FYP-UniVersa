import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/addtodolist/addtodolist_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';

class TodolistViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  Future<void> event(Map data, bool update) async {
    await _navigationService.navigateWithTransition(
        AddtodolistView(
          update: update,
          data: data,
        ),
        routeName: Routes.addtodolistView,
        transitionStyle: Transition.rightToLeft);
    notifyListeners();
  }

  Future<void> deletetodolist(String id, BuildContext context) async {
    await ApiHelper.deletetodolist(id, context);
    notifyListeners();
  }
}
