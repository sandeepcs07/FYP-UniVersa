import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/app_colors.dart';
import '../../../common/customwidget/button_helper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../common/customwidget/text_helper.dart';
import '../../../common/customwidget/text_view_helper.dart';
import '../../../common/ui_helpers.dart';
import '../chating/chating_view.dart';

class ResourceViewModel extends BaseViewModel {
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
                        await ApiHelper.registerresource(
                            sharedpref.readString("email"),
                            url,
                            "img",
                            des.text,
                            context);
                        await FirebaseHelper.sendallnotification(
                            "Resource", "New Item Added");
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

  void dia2(BuildContext context, File pdfFile) {
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
                        try {
                          displayprogress(context);
                          final url = await FirebaseHelper.uploadFile(
                            pdfFile,
                            sharedpref.readString('number'),
                          );
                          await ApiHelper.registerresource(
                            sharedpref.readString('email'),
                            url,
                            'pdf',
                            des.text,
                            context,
                          );
                          await FirebaseHelper.sendallnotification(
                            'Resource',
                            'New PDF Added 📄',
                          );
                          notifyListeners();
                        } catch (e) {
                          show_snackbar(context, 'Upload failed: $e');
                        } finally {
                          des.clear();
                          _navigationService.back();
                          hideprogress(context);
                        }
                      },
                      child: text_helper(data: "Save")),
                ],
              ),
            ),
          );
        });
  }

  Future<void> file(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null || result.files.single.path == null) return;

    final String path = result.files.single.path!;

    final File pdfFile = File(path);

    dia2(context, pdfFile);
  }

  Future<void> deletelost(String id, BuildContext context) async {
    await ApiHelper.deleteresource(id, context);
    notifyListeners();
  }

  Future<void> chat(String did, BuildContext context) async {
    Map c = await ApiHelper.registerchat(did, did, "true");
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
