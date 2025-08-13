import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';

class AddcarpoolViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController to = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController charges = TextEditingController();
  TextEditingController seats = TextEditingController();

  void selectDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((value) {
      showTimePicker(context: context, initialTime: TimeOfDay.now())
          .then((valuet) {
        date.text =
            "${value.toString().substring(0, 10)} ${valuet.toString().substring(10, 15)}";
      });
      notifyListeners();
    });
  }

  Future<void> add(BuildContext context) async {
    if (to.text.trim().isEmpty ||
        from.text.trim().isEmpty ||
        date.text.trim().isEmpty ||
        charges.text.trim().isEmpty ||
        seats.text.trim().isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else {
      displayprogress(context);
      await ApiHelper.registercarpool(sharedpref.readString("email"), to.text,
          from.text, date.text, seats.text, charges.text, context);
      await FirebaseHelper.sendallnotification("Carpool", "New Carpool Added");
      hideprogress(context);
      _navigationService.back();
    }
  }

  Future<void> update(BuildContext context, Map data) async {
    if (to.text.isEmpty ||
        from.text.isEmpty ||
        date.text.isEmpty ||
        charges.text.isEmpty ||
        seats.text.isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else {
      displayprogress(context);
      await ApiHelper.updatecarpool(data["_id"], to.text, from.text, date.text,
          seats.text, charges.text, context);
      await FirebaseHelper.sendallnotification("carpool", "carpool updated");
      hideprogress(context);
      _navigationService.back();
    }
  }
}
