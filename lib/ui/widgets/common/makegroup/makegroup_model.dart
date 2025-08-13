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

class MakegroupModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  File? image;
  TextEditingController title = TextEditingController();
  Future<void> pic() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> groups(BuildContext context) async {
    if (title.text.isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else if (image == null) {
      show_snackbar(context, "select Image");
    } else {
      displayprogress(context);
      String url = await FirebaseHelper.uploadFile(image, "");
      await ApiHelper.registergroup(title.text, url, context);
      hideprogress(context);
      _navigationService.back();
    }
  }
}
