// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../customwidget/snakbar_helper.dart';
import 'firebsaeuploadhelper.dart';

const url = 'http://10.0.2.2:3000/';
const registrationlink = "${url}register";
const loginlink = "${url}login";
const findonelink = "${url}findone";
const alluserslink = "${url}allusers";

// event
const registereventlink = "${url}registerevent";
const alleventlink = "${url}allevent";
const updateeventlink = "${url}updateevent";
const deleteeventlink = "${url}deleteevent";

// carpool
const registercarpoollink = "${url}registercarpool";
const allcarpoollink = "${url}allcarpool";
const updatecarpoollink = "${url}updatecarpool";
const deletecarpoollink = "${url}deletecarpool";

// todolist
const registertodolistlink = "${url}registertodolist";
const alltodolistlink = "${url}alltodolist";
const updatetodolistlink = "${url}updatetodolist";
const deletetodolistlink = "${url}deletetodolist";

// group
const registergrouplink = "${url}registergroup";
const allgrouplink = "${url}allgroup";

// timetable
const registertimetablelink = "${url}registertimetable";
const alltimetablelink = "${url}alltimetable";
const deletetimetablelink = "${url}deletetimetable";
const updatetimetablelink = "${url}updatetimetable";

// job
const registerjoblink = "${url}registerjob";
const alljoblink = "${url}alljob";
const updatejoblink = "${url}updatejob";
const deletejoblink = "${url}deletejob";

// lostandfound
const registerlostlink = "${url}registerlost";
const alllostlink = "${url}alllost";
const deletelostlink = "${url}deletelost";

// resource
const registerresourcelink = "${url}registerresource";
const allresourcelink = "${url}allresource";
const deleteresourcelink = "${url}deleteresource";

// market
const registermarketlink = "${url}registermarket";
const allmarketlink = "${url}allmarket";
const updatemarketlink = "${url}updatemarket";
const deletemarketlink = "${url}deletemarket";

// notes
const registernoteslink = "${url}registernotes";
const allnoteslink = "${url}allnotes";
const updatenoteslink = "${url}updatenotes";
const deletenoteslink = "${url}deletenotes";

// chat
const registerchatlink = "${url}registerchat";
const allchatbyidlink = "${url}allchatbyid";
const addchatlink = "${url}addchat";
const chatstatuslink = "${url}chatstatus";
const allchatbydidlink = "${url}allchatbydid";

class ApiHelper {
  // chat
  static Future<Map> registerchat(String uid, String did, String status) async {
    try {
      var response = await http.post(Uri.parse(registerchatlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "did": did,
            "c": [],
            "date": DateTime.now().toString(),
            "status": status,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } catch (e) {
      return {};
    }
  }

  static Future<Map> allchatbyid(String id) async {
    try {
      var response = await http.post(Uri.parse(allchatbyidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return {};
    }
  }

  static Future<List> allchatbydid(String did) async {
    try {
      var response = await http.post(Uri.parse(allchatbydidlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"did": did}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> addchat(String id, Map dataa, String sendto) async {
    try {
      var response = await http.post(Uri.parse(addchatlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "data": dataa}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      Map d = await findone(sendto);
      await FirebaseHelper.sendPushMessage(
          d['deviceid'], "New Message", dataa['mess']);
      return data['status'] as bool;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> chatstatus(String id, String status) async {
    try {
      var response = await http.post(Uri.parse(chatstatuslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "status": status}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return true;
    } catch (e) {
      return false;
    }
  }

  // auth
  static Future<bool> registration(
      String name,
      String number,
      String img,
      String email,
      String pass,
      String cat,
      String deviceid,
      BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registrationlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": name,
            "number": number,
            "img": img,
            "email": email,
            "pass": pass,
            "cat": cat,
            "deviceid": deviceid,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      hideprogress(context);
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<Map> login(
      String email, String pass, String deviceid, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(loginlink),
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({"email": email, "pass": pass, "deviceid": deviceid}));
      var data = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      hideprogress(context);
      if (data['status']) {
        return data['token'];
      } else {
        show_snackbar(context, data['message']);
        return {};
      }
    } catch (e) {
      hideprogress(context);
      show_snackbar(context, 'try again later');
      return {};
    }
  }

  static Future<Map> findone(String number) async {
    try {
      var response = await http.post(Uri.parse(findonelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": number}));
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'] as Map;
      return data;
    } catch (e) {
      return {};
    }
  }

  static Future<List> allusers() async {
    try {
      var response = await http.post(Uri.parse(alluserslink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      return data;
    } catch (e) {
      return [];
    }
  }

  // event
  static Future<bool> registerevent(String uid, String title, String des,
      String cat, String img, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registereventlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "title": title,
            "des": des,
            "cat": cat,
            "img": img,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> allevent() async {
    try {
      var response = await http.post(Uri.parse(alleventlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deleteevent(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deleteeventlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<bool> updateevent(String id, String title, String des,
      String cat, String img, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updateeventlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "title": title,
            "des": des,
            "cat": cat,
            "img": img,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // carpool
  static Future<bool> registercarpool(String uid, String to, String form,
      String date, String seats, String charges, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registercarpoollink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "to": to,
            "form": form,
            "date": date,
            "seats": seats,
            "charges": charges,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> allcarpool() async {
    try {
      var response = await http.post(Uri.parse(allcarpoollink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deletecarpool(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deletecarpoollink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<bool> updatecarpool(String id, String to, String form,
      String date, String seats, String charges, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatecarpoollink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "to": to,
            "form": form,
            "date": date,
            "seats": seats,
            "charges": charges,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // todolist
  static Future<bool> registertodolist(String uid, String title, String des,
      String date, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registertodolistlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "title": title,
            "des": des,
            "date": date,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> alltodolist() async {
    try {
      var response = await http.post(Uri.parse(alltodolistlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deletetodolist(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deletetodolistlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<bool> updatetodolist(String id, String title, String des,
      String date, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatetodolistlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "title": title,
            "des": des,
            "date": date,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // group
  static Future<bool> registergroup(
      String title, String img, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registergrouplink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "title": title,
            "img": img,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> allgroup() async {
    try {
      var response = await http.post(Uri.parse(allgrouplink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  // timetable
  static Future<bool> registertimetable(
      String uid, String img, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registertimetablelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "uid": uid,
            "img": img,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> alltimetable() async {
    try {
      var response = await http.post(Uri.parse(alltimetablelink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deletetimetable(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deletetimetablelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<bool> updatetimetable(
      String id, String img, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatetimetablelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "img": img,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // job
  static Future<bool> registerjob(String uid, String img, String title,
      String des, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerjoblink),
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({"uid": uid, "img": img, "title": title, "des": des}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> alljob() async {
    try {
      var response = await http.post(Uri.parse(alljoblink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deletejob(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deletejoblink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<bool> updatejob(String id, String img, String title, String des,
      BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatejoblink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "img": img, "title": title, "des": des}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // lost and found
  static Future<bool> registerlost(
      String uid, String img, String des, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerlostlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"uid": uid, "img": img, "des": des}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> alllost() async {
    try {
      var response = await http.post(Uri.parse(alllostlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deletelost(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deletelostlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // resource
  static Future<bool> registerresource(String uid, String img, String type,
      String des, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registerresourcelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"uid": uid, "img": img, "type": type, "des": des}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> allresource() async {
    try {
      var response = await http.post(Uri.parse(allresourcelink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deleteresource(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deleteresourcelink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // market
  static Future<bool> registermarket(String uid, String img, String title,
      String des, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registermarketlink),
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({"uid": uid, "img": img, "title": title, "des": des}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> allmarket() async {
    try {
      var response = await http.post(Uri.parse(allmarketlink),
          headers: {"Content-Type": "application/json"});
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deletemarket(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deletemarketlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<bool> updatemarket(String id, String img, String title,
      String des, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatemarketlink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"id": id, "img": img, "title": title, "des": des}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  // notes
  static Future<bool> registernotes(
      String uid, String title, String des, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(registernoteslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"uid": uid, "title": title, "des": des}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      show_snackbar(context, data['message']);
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<List> allnotes(String uid) async {
    try {
      var response = await http.post(Uri.parse(allnoteslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"uid": uid}));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['data'];
    } catch (e) {
      return [];
    }
  }

  static Future<bool> deletenotes(String id, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(deletenoteslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }

  static Future<bool> updatenotes(
      String id, String title, String des, BuildContext context) async {
    try {
      var response = await http.post(Uri.parse(updatenoteslink),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "id": id,
            "title": title,
            "des": des,
          }));
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      return data['status'] as bool;
    } catch (e) {
      show_snackbar(context, 'try again later');
      return false;
    }
  }
}
