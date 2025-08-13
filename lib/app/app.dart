import 'package:unievents/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:unievents/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:unievents/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/services/sharedpref_service.dart';
import 'package:unievents/ui/views/auth/login/login_view.dart';
import 'package:unievents/ui/views/auth/singup/singup_view.dart';
import 'package:unievents/services/fire_service.dart';
import 'package:unievents/ui/views/parents/parent/parent_view.dart';
import 'package:unievents/ui/views/teachers/teacher/teacher_view.dart';
import 'package:unievents/ui/views/students/student/student_view.dart';
import 'package:unievents/ui/views/admins/admin/admin_view.dart';
import 'package:unievents/ui/views/common/addevents/addevents_view.dart';
import 'package:unievents/ui/views/common/allevents/allevents_view.dart';
import 'package:unievents/ui/views/common/addtimetable/addtimetable_view.dart';
import 'package:unievents/ui/views/common/addjob/addjob_view.dart';
import 'package:unievents/ui/views/common/alltimetable/alltimetable_view.dart';
import 'package:unievents/ui/views/students/users/users_view.dart';
import 'package:unievents/ui/views/common/chating/chating_view.dart';
import 'package:unievents/ui/views/common/allchat/allchat_view.dart';
import 'package:unievents/ui/views/common/addnotes/addnotes_view.dart';
import 'package:unievents/ui/views/common/allnotes/allnotes_view.dart';
import 'package:unievents/ui/views/common/chatbot/chatbot_view.dart';
import 'package:unievents/ui/views/common/alljob/alljob_view.dart';
import 'package:unievents/ui/views/common/addmarketplace/addmarketplace_view.dart';
import 'package:unievents/ui/views/common/addcarpool/addcarpool_view.dart';
import 'package:unievents/ui/views/common/resource/resource_view.dart';
import 'package:unievents/ui/views/common/lostandfound/lostandfound_view.dart';
import 'package:unievents/ui/views/common/todolist/todolist_view.dart';
import 'package:unievents/ui/views/common/addtodolist/addtodolist_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SingupView),
    MaterialRoute(page: ParentView),
    MaterialRoute(page: TeacherView),
    MaterialRoute(page: StudentView),
    MaterialRoute(page: AdminView),
    MaterialRoute(page: AddeventsView),
    MaterialRoute(page: AlleventsView),
    MaterialRoute(page: AddtimetableView),
    MaterialRoute(page: AddjobView),
    MaterialRoute(page: AlltimetableView),
    MaterialRoute(page: UsersView),
    MaterialRoute(page: ChatingView),
    MaterialRoute(page: AllchatView),
    MaterialRoute(page: AddnotesView),
    MaterialRoute(page: AllnotesView),
    MaterialRoute(page: ChatbotView),
    MaterialRoute(page: AlljobView),
    MaterialRoute(page: AddmarketplaceView),
    MaterialRoute(page: AddcarpoolView),
    MaterialRoute(page: ResourceView),
    MaterialRoute(page: LostandfoundView),
    MaterialRoute(page: TodolistView),
    MaterialRoute(page: AddtodolistView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SharedprefService),
    LazySingleton(classType: FireService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
