import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../main.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/apihelper/apihelper.dart';
import '../../../common/apihelper/firebsaeuploadhelper.dart';
import '../../../common/customwidget/snakbar_helper.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AddtodolistViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController date = TextEditingController();

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
        notifyListeners();
      });
      notifyListeners();
    });
  }

  Future<void> add(BuildContext context) async {
    if (title.text.trim().isEmpty || des.text.trim().isEmpty || date.text.trim().isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else {
      displayprogress(context);
      await ApiHelper.registertodolist(sharedpref.readString("email"),
          title.text, des.text, date.text, context);

      scheduleNotification(
          id: 0,
          title: title.text,
          body: des.text,
          scheduledDate: DateTime.parse(date.text));

      await FirebaseHelper.sendallnotification("To do list", "New to do Added");
      hideprogress(context);
      _navigationService.back();
    }
  }

  void scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    tz.initializeTimeZones();
    final location = tz.local;

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, location),
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            importance: Importance.high,
            priority: Priority.high,
            playSound: true,
            icon: '@mipmap/ic_launcher'),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> update(BuildContext context, Map data) async {
    if (title.text.trim().isEmpty || des.text.trim().isEmpty || date.text.trim().isEmpty) {
      show_snackbar(context, "Fill all fields");
    } else {
      displayprogress(context);
      await ApiHelper.updatetodolist(
          data["_id"], title.text, des.text, date.text, context);
      await FirebaseHelper.sendallnotification("carpool", "carpool updated");
      hideprogress(context);
      _navigationService.back();
    }
  }
}
