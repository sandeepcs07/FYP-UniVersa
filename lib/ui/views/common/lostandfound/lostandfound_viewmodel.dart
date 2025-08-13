import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/common/app_colors.dart';
import 'package:unievents/ui/common/customwidget/button_helper.dart';
import 'package:unievents/ui/common/customwidget/snakbar_helper.dart';
import 'package:unievents/ui/common/customwidget/text_view_helper.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/ui_helpers.dart';
import '../chating/chating_view.dart';

class LostandfoundViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController des = TextEditingController();

  Future<void> pic(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      dia(context, pickedFile);
    }
  }

  void dia(BuildContext context, XFile pickedFile) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(10),
              color: white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  text_view_helper(hint: "Enter Description", controller: des),
                  verticalSpaceSmall,
                  button_helper(
                      onpress: () async {
                        File image = File(pickedFile.path);

                        displayprogress(context);
                        String url = await FirebaseHelper.uploadFile(
                            image, sharedpref.readString("number"));
                        await ApiHelper.registerlost(
                            sharedpref.readString("email"),
                            url,
                            des.text,
                            context);
                        await FirebaseHelper.sendallnotification(
                            "Lost and found", "New Item Added");
                        hideprogress(context);
                        des.clear();
                        _navigationService.back();
                        notifyListeners();
                      },
                      child: text_helper(data: "Save")),
                ],
              ),
            ),
          );
        });
  }

  Future<void> deletelost(String id, BuildContext context) async {
    await ApiHelper.deletelost(id, context);
    notifyListeners();
  }

  Future<void> chat(String did, BuildContext context) async {
    Map c = await ApiHelper.registerchat(
        did, sharedpref.readString("email"), "true");
    if (c['status']) {
      _navigationService.navigateWithTransition(
          ChatingView(
            id: c['message'],
            did: c['did'],
          ),
          routeName: Routes.chatingView,
          transitionStyle: Transition.rightToLeft);
    }
  }
}
