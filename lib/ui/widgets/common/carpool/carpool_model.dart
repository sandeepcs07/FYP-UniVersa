import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/common/apihelper/apihelper.dart';
import 'package:unievents/ui/views/common/addcarpool/addcarpool_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import '../../../views/common/chating/chating_view.dart';

class CarpoolModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController search = TextEditingController();

  Future<void> event(Map data, bool update) async {
    await _navigationService.navigateWithTransition(
        AddcarpoolView(
          update: update,
          data: data,
        ),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
    notifyListeners();
  }

  Future<void> deleteCarpool(String id, BuildContext context) async {
    await ApiHelper.deletecarpool(id, context);
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

  Future<void> sendLocation() async {
    // 1. Check current permission status
    LocationPermission permission = await Geolocator.checkPermission();

    // 2. If denied, request permission
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }

    // 3. If permanently denied, bail out
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // 4. Permission granted, get the position
    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // 5. Build the Google Maps link
    final mapsUrl = 'https://www.google.com/maps/search/?api=1&query=${pos.latitude},${pos.longitude}';

    // 6. Use share_plus to open system share dialog
    await Share.share('Here’s my location: $mapsUrl');
  }
}
