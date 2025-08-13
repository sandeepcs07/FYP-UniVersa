// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i27;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i28;
import 'package:unievents/ui/views/admins/admin/admin_view.dart' as _i8;
import 'package:unievents/ui/views/auth/login/login_view.dart' as _i3;
import 'package:unievents/ui/views/auth/singup/singup_view.dart' as _i4;
import 'package:unievents/ui/views/common/addcarpool/addcarpool_view.dart'
    as _i22;
import 'package:unievents/ui/views/common/addevents/addevents_view.dart' as _i9;
import 'package:unievents/ui/views/common/addjob/addjob_view.dart' as _i12;
import 'package:unievents/ui/views/common/addmarketplace/addmarketplace_view.dart'
    as _i21;
import 'package:unievents/ui/views/common/addnotes/addnotes_view.dart' as _i17;
import 'package:unievents/ui/views/common/addtimetable/addtimetable_view.dart'
    as _i11;
import 'package:unievents/ui/views/common/addtodolist/addtodolist_view.dart'
    as _i26;
import 'package:unievents/ui/views/common/allchat/allchat_view.dart' as _i16;
import 'package:unievents/ui/views/common/allevents/allevents_view.dart'
    as _i10;
import 'package:unievents/ui/views/common/alljob/alljob_view.dart' as _i20;
import 'package:unievents/ui/views/common/allnotes/allnotes_view.dart' as _i18;
import 'package:unievents/ui/views/common/alltimetable/alltimetable_view.dart'
    as _i13;
import 'package:unievents/ui/views/common/chatbot/chatbot_view.dart' as _i19;
import 'package:unievents/ui/views/common/chating/chating_view.dart' as _i15;
import 'package:unievents/ui/views/common/lostandfound/lostandfound_view.dart'
    as _i24;
import 'package:unievents/ui/views/common/resource/resource_view.dart' as _i23;
import 'package:unievents/ui/views/common/todolist/todolist_view.dart' as _i25;
import 'package:unievents/ui/views/parents/parent/parent_view.dart' as _i5;
import 'package:unievents/ui/views/startup/startup_view.dart' as _i2;
import 'package:unievents/ui/views/students/student/student_view.dart' as _i7;
import 'package:unievents/ui/views/students/users/users_view.dart' as _i14;
import 'package:unievents/ui/views/teachers/teacher/teacher_view.dart' as _i6;

class Routes {
  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const singupView = '/singup-view';

  static const parentView = '/parent-view';

  static const teacherView = '/teacher-view';

  static const studentView = '/student-view';

  static const adminView = '/admin-view';

  static const addeventsView = '/addevents-view';

  static const alleventsView = '/allevents-view';

  static const addtimetableView = '/addtimetable-view';

  static const addjobView = '/addjob-view';

  static const alltimetableView = '/alltimetable-view';

  static const usersView = '/users-view';

  static const chatingView = '/chating-view';

  static const allchatView = '/allchat-view';

  static const addnotesView = '/addnotes-view';

  static const allnotesView = '/allnotes-view';

  static const chatbotView = '/chatbot-view';

  static const alljobView = '/alljob-view';

  static const addmarketplaceView = '/addmarketplace-view';

  static const addcarpoolView = '/addcarpool-view';

  static const resourceView = '/resource-view';

  static const lostandfoundView = '/lostandfound-view';

  static const todolistView = '/todolist-view';

  static const addtodolistView = '/addtodolist-view';

  static const all = <String>{
    startupView,
    loginView,
    singupView,
    parentView,
    teacherView,
    studentView,
    adminView,
    addeventsView,
    alleventsView,
    addtimetableView,
    addjobView,
    alltimetableView,
    usersView,
    chatingView,
    allchatView,
    addnotesView,
    allnotesView,
    chatbotView,
    alljobView,
    addmarketplaceView,
    addcarpoolView,
    resourceView,
    lostandfoundView,
    todolistView,
    addtodolistView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.singupView,
      page: _i4.SingupView,
    ),
    _i1.RouteDef(
      Routes.parentView,
      page: _i5.ParentView,
    ),
    _i1.RouteDef(
      Routes.teacherView,
      page: _i6.TeacherView,
    ),
    _i1.RouteDef(
      Routes.studentView,
      page: _i7.StudentView,
    ),
    _i1.RouteDef(
      Routes.adminView,
      page: _i8.AdminView,
    ),
    _i1.RouteDef(
      Routes.addeventsView,
      page: _i9.AddeventsView,
    ),
    _i1.RouteDef(
      Routes.alleventsView,
      page: _i10.AlleventsView,
    ),
    _i1.RouteDef(
      Routes.addtimetableView,
      page: _i11.AddtimetableView,
    ),
    _i1.RouteDef(
      Routes.addjobView,
      page: _i12.AddjobView,
    ),
    _i1.RouteDef(
      Routes.alltimetableView,
      page: _i13.AlltimetableView,
    ),
    _i1.RouteDef(
      Routes.usersView,
      page: _i14.UsersView,
    ),
    _i1.RouteDef(
      Routes.chatingView,
      page: _i15.ChatingView,
    ),
    _i1.RouteDef(
      Routes.allchatView,
      page: _i16.AllchatView,
    ),
    _i1.RouteDef(
      Routes.addnotesView,
      page: _i17.AddnotesView,
    ),
    _i1.RouteDef(
      Routes.allnotesView,
      page: _i18.AllnotesView,
    ),
    _i1.RouteDef(
      Routes.chatbotView,
      page: _i19.ChatbotView,
    ),
    _i1.RouteDef(
      Routes.alljobView,
      page: _i20.AlljobView,
    ),
    _i1.RouteDef(
      Routes.addmarketplaceView,
      page: _i21.AddmarketplaceView,
    ),
    _i1.RouteDef(
      Routes.addcarpoolView,
      page: _i22.AddcarpoolView,
    ),
    _i1.RouteDef(
      Routes.resourceView,
      page: _i23.ResourceView,
    ),
    _i1.RouteDef(
      Routes.lostandfoundView,
      page: _i24.LostandfoundView,
    ),
    _i1.RouteDef(
      Routes.todolistView,
      page: _i25.TodolistView,
    ),
    _i1.RouteDef(
      Routes.addtodolistView,
      page: _i26.AddtodolistView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.SingupView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SingupView(),
        settings: data,
      );
    },
    _i5.ParentView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ParentView(),
        settings: data,
      );
    },
    _i6.TeacherView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.TeacherView(),
        settings: data,
      );
    },
    _i7.StudentView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.StudentView(),
        settings: data,
      );
    },
    _i8.AdminView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AdminView(),
        settings: data,
      );
    },
    _i9.AddeventsView: (data) {
      final args = data.getArgs<AddeventsViewArguments>(
        orElse: () => const AddeventsViewArguments(),
      );
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i9.AddeventsView(
            key: args.key, update: args.update, data: args.data),
        settings: data,
      );
    },
    _i10.AlleventsView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.AlleventsView(),
        settings: data,
      );
    },
    _i11.AddtimetableView: (data) {
      final args = data.getArgs<AddtimetableViewArguments>(
        orElse: () => const AddtimetableViewArguments(),
      );
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i11.AddtimetableView(
            key: args.key, update: args.update, data: args.data),
        settings: data,
      );
    },
    _i12.AddjobView: (data) {
      final args = data.getArgs<AddjobViewArguments>(
        orElse: () => const AddjobViewArguments(),
      );
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.AddjobView(
            key: args.key, update: args.update, data: args.data),
        settings: data,
      );
    },
    _i13.AlltimetableView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.AlltimetableView(),
        settings: data,
      );
    },
    _i14.UsersView: (data) {
      final args = data.getArgs<UsersViewArguments>(nullOk: false);
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i14.UsersView(key: args.key, cat: args.cat),
        settings: data,
      );
    },
    _i15.ChatingView: (data) {
      final args = data.getArgs<ChatingViewArguments>(nullOk: false);
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i15.ChatingView(key: args.key, id: args.id, did: args.did),
        settings: data,
      );
    },
    _i16.AllchatView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.AllchatView(),
        settings: data,
      );
    },
    _i17.AddnotesView: (data) {
      final args = data.getArgs<AddnotesViewArguments>(
        orElse: () => const AddnotesViewArguments(),
      );
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i17.AddnotesView(
            key: args.key, update: args.update, data: args.data),
        settings: data,
      );
    },
    _i18.AllnotesView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.AllnotesView(),
        settings: data,
      );
    },
    _i19.ChatbotView: (data) {
      final args = data.getArgs<ChatbotViewArguments>(
        orElse: () => const ChatbotViewArguments(),
      );
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i19.ChatbotView(key: args.key),
        settings: data,
      );
    },
    _i20.AlljobView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.AlljobView(),
        settings: data,
      );
    },
    _i21.AddmarketplaceView: (data) {
      final args = data.getArgs<AddmarketplaceViewArguments>(
        orElse: () => const AddmarketplaceViewArguments(),
      );
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i21.AddmarketplaceView(
            key: args.key, update: args.update, data: args.data),
        settings: data,
      );
    },
    _i22.AddcarpoolView: (data) {
      final args = data.getArgs<AddcarpoolViewArguments>(
        orElse: () => const AddcarpoolViewArguments(),
      );
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i22.AddcarpoolView(
            key: args.key, update: args.update, data: args.data),
        settings: data,
      );
    },
    _i23.ResourceView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.ResourceView(),
        settings: data,
      );
    },
    _i24.LostandfoundView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.LostandfoundView(),
        settings: data,
      );
    },
    _i25.TodolistView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.TodolistView(),
        settings: data,
      );
    },
    _i26.AddtodolistView: (data) {
      return _i27.MaterialPageRoute<dynamic>(
        builder: (context) => _i26.AddtodolistView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AddeventsViewArguments {
  const AddeventsViewArguments({
    this.key,
    this.update = false,
    this.data,
  });

  final _i27.Key? key;

  final bool update;

  final Map<dynamic, dynamic>? data;

  @override
  String toString() {
    return '{"key": "$key", "update": "$update", "data": "$data"}';
  }

  @override
  bool operator ==(covariant AddeventsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.update == update && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ update.hashCode ^ data.hashCode;
  }
}

class AddtimetableViewArguments {
  const AddtimetableViewArguments({
    this.key,
    this.update = false,
    this.data,
  });

  final _i27.Key? key;

  final bool update;

  final Map<dynamic, dynamic>? data;

  @override
  String toString() {
    return '{"key": "$key", "update": "$update", "data": "$data"}';
  }

  @override
  bool operator ==(covariant AddtimetableViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.update == update && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ update.hashCode ^ data.hashCode;
  }
}

class AddjobViewArguments {
  const AddjobViewArguments({
    this.key,
    this.update = false,
    this.data,
  });

  final _i27.Key? key;

  final bool update;

  final Map<dynamic, dynamic>? data;

  @override
  String toString() {
    return '{"key": "$key", "update": "$update", "data": "$data"}';
  }

  @override
  bool operator ==(covariant AddjobViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.update == update && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ update.hashCode ^ data.hashCode;
  }
}

class UsersViewArguments {
  const UsersViewArguments({
    this.key,
    required this.cat,
  });

  final _i27.Key? key;

  final String cat;

  @override
  String toString() {
    return '{"key": "$key", "cat": "$cat"}';
  }

  @override
  bool operator ==(covariant UsersViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.cat == cat;
  }

  @override
  int get hashCode {
    return key.hashCode ^ cat.hashCode;
  }
}

class ChatingViewArguments {
  const ChatingViewArguments({
    this.key,
    required this.id,
    required this.did,
  });

  final _i27.Key? key;

  final String id;

  final String did;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "did": "$did"}';
  }

  @override
  bool operator ==(covariant ChatingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id && other.did == did;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode ^ did.hashCode;
  }
}

class AddnotesViewArguments {
  const AddnotesViewArguments({
    this.key,
    this.update = false,
    this.data,
  });

  final _i27.Key? key;

  final bool update;

  final Map<dynamic, dynamic>? data;

  @override
  String toString() {
    return '{"key": "$key", "update": "$update", "data": "$data"}';
  }

  @override
  bool operator ==(covariant AddnotesViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.update == update && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ update.hashCode ^ data.hashCode;
  }
}

class ChatbotViewArguments {
  const ChatbotViewArguments({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ChatbotViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddmarketplaceViewArguments {
  const AddmarketplaceViewArguments({
    this.key,
    this.update = false,
    this.data,
  });

  final _i27.Key? key;

  final bool update;

  final Map<dynamic, dynamic>? data;

  @override
  String toString() {
    return '{"key": "$key", "update": "$update", "data": "$data"}';
  }

  @override
  bool operator ==(covariant AddmarketplaceViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.update == update && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ update.hashCode ^ data.hashCode;
  }
}

class AddcarpoolViewArguments {
  const AddcarpoolViewArguments({
    this.key,
    this.update = false,
    this.data,
  });

  final _i27.Key? key;

  final bool update;

  final Map<dynamic, dynamic>? data;

  @override
  String toString() {
    return '{"key": "$key", "update": "$update", "data": "$data"}';
  }

  @override
  bool operator ==(covariant AddcarpoolViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.update == update && other.data == data;
  }

  @override
  int get hashCode {
    return key.hashCode ^ update.hashCode ^ data.hashCode;
  }
}

extension NavigatorStateExtension on _i28.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSingupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.singupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToParentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.parentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeacherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.teacherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddeventsView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addeventsView,
        arguments: AddeventsViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAlleventsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.alleventsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddtimetableView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addtimetableView,
        arguments:
            AddtimetableViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddjobView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addjobView,
        arguments: AddjobViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAlltimetableView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.alltimetableView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUsersView({
    _i27.Key? key,
    required String cat,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.usersView,
        arguments: UsersViewArguments(key: key, cat: cat),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatingView({
    _i27.Key? key,
    required String id,
    required String did,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatingView,
        arguments: ChatingViewArguments(key: key, id: id, did: did),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllchatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allchatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddnotesView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addnotesView,
        arguments: AddnotesViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAllnotesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.allnotesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChatbotView({
    _i27.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.chatbotView,
        arguments: ChatbotViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAlljobView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.alljobView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddmarketplaceView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addmarketplaceView,
        arguments:
            AddmarketplaceViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddcarpoolView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addcarpoolView,
        arguments:
            AddcarpoolViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResourceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resourceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLostandfoundView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.lostandfoundView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTodolistView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.todolistView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddtodolistView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addtodolistView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSingupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.singupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithParentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.parentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeacherView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.teacherView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddeventsView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addeventsView,
        arguments: AddeventsViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAlleventsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.alleventsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddtimetableView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addtimetableView,
        arguments:
            AddtimetableViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddjobView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addjobView,
        arguments: AddjobViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAlltimetableView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.alltimetableView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUsersView({
    _i27.Key? key,
    required String cat,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.usersView,
        arguments: UsersViewArguments(key: key, cat: cat),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatingView({
    _i27.Key? key,
    required String id,
    required String did,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatingView,
        arguments: ChatingViewArguments(key: key, id: id, did: did),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllchatView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allchatView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddnotesView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addnotesView,
        arguments: AddnotesViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAllnotesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.allnotesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChatbotView({
    _i27.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.chatbotView,
        arguments: ChatbotViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAlljobView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.alljobView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddmarketplaceView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addmarketplaceView,
        arguments:
            AddmarketplaceViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddcarpoolView({
    _i27.Key? key,
    bool update = false,
    Map<dynamic, dynamic>? data,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.addcarpoolView,
        arguments:
            AddcarpoolViewArguments(key: key, update: update, data: data),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResourceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resourceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLostandfoundView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.lostandfoundView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTodolistView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.todolistView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddtodolistView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addtodolistView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
