import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';

class AddnotesViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();

  Future<void> add(BuildContext context) async {
    if (title.text.trim().isEmpty || des.text.trim().isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else {
      displayprogress(context);
      await ApiHelper.registernotes(
          sharedpref.readString("email"), title.text, des.text, context);
      hideprogress(context);
      _navigationService.back();
    }
  }

  Future<void> update(BuildContext context, Map data) async {
    displayprogress(context);
    await ApiHelper.updatenotes(data["_id"], title.text, des.text, context);
    hideprogress(context);
    _navigationService.back();
  }
}
