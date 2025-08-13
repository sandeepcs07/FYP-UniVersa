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

class AddmarketplaceViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();

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
    if (title.text.trim().isEmpty || des.text.trim().isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else if (image == null) {
      show_snackbar(context, "Add a image");
    } else {
      displayprogress(context);
      String url = await FirebaseHelper.uploadFile(
          image, sharedpref.readString("number"));
      await ApiHelper.registermarket(
          sharedpref.readString("email"), url, title.text, des.text, context);
      await FirebaseHelper.sendallnotification("Job", "New Job Added");
      hideprogress(context);
      _navigationService.back();
    }
  }

  Future<void> update(BuildContext context, Map data) async {
    if (title.text.trim().isEmpty || des.text.trim().isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else {
      displayprogress(context);
      String url = img;
      if (image != null) {
        url = await FirebaseHelper.uploadFile(
            image, sharedpref.readString("number"));
      }
      await ApiHelper.updatemarket(
          data["_id"], url, title.text, des.text, context);
      await FirebaseHelper.sendallnotification("Event", "New Event Added");
      hideprogress(context);
      _navigationService.back();
    }
  }
}
