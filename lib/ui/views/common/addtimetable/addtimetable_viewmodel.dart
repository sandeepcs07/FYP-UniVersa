import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';

class AddtimetableViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  String img = "";

  File? image;
  Future<void> pic() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> add(BuildContext context) async {
    if (image == null) {
      show_snackbar(context, "Add a image");
    } else {
      displayprogress(context);
      String url = await FirebaseHelper.uploadFile(
          image, sharedpref.readString("number"));
      await ApiHelper.registertimetable(
          sharedpref.readString("email"), url, context);
      await FirebaseHelper.sendallnotification(
          "TimeTable", "New TimeTable Added");
      hideprogress(context);
      _navigationService.back();
    }
  }

  Future<void> update(BuildContext context, Map data) async {
    displayprogress(context);
    String url = img;
    if (image != null) {
      url = await FirebaseHelper.uploadFile(
          image, sharedpref.readString("number"));
    }
    await ApiHelper.updatetimetable(data["_id"], url, context);
    await FirebaseHelper.sendallnotification("Event", "New Event Added");
    hideprogress(context);
    _navigationService.back();
  }
}
