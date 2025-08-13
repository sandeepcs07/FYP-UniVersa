import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/alljob/alljob_view.dart';
import 'package:unievents/ui/views/common/allnotes/allnotes_view.dart';
import 'package:unievents/ui/views/common/alltimetable/alltimetable_view.dart';
import 'package:unievents/ui/views/common/lostandfound/lostandfound_view.dart';
import 'package:unievents/ui/views/common/resource/resource_view.dart';
import 'package:unievents/ui/views/common/todolist/todolist_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../views/auth/login/login_view.dart';
import '../../../views/common/addevents/addevents_view.dart';
import '../../../views/common/addjob/addjob_view.dart';
import '../../../views/common/addtimetable/addtimetable_view.dart';
import '../../../views/common/allevents/allevents_view.dart';
import '../../../views/common/chatbot/chatbot_view.dart';

class HomedetailsModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final sharedpref = locator<SharedprefService>();

  void logout() {
    sharedpref.remove("auth");
    sharedpref.remove('name');
    sharedpref.remove('number');
    sharedpref.remove('email');
    sharedpref.remove('cat');
    sharedpref.remove('img');
    sharedpref.remove('deviceid');
    _navigationService.clearStackAndShow(Routes.loginView);
    _navigationService.replaceWithTransition(const LoginView(),
        routeName: Routes.loginView, transitionStyle: Transition.rightToLeft);
  }

  void addevent() {
    _navigationService.navigateWithTransition(AddeventsView(),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
  }

  void allevent() {
    _navigationService.navigateWithTransition(const AlleventsView(),
        routeName: Routes.alleventsView,
        transitionStyle: Transition.rightToLeft);
  }

  void alltimetable() {
    _navigationService.navigateWithTransition(const AlltimetableView(),
        routeName: Routes.alltimetableView,
        transitionStyle: Transition.rightToLeft);
  }

  void addtimetable() {
    _navigationService.navigateWithTransition(AddtimetableView(),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
  }

  void addjob() {
    _navigationService.navigateWithTransition(AddjobView(),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
  }

  void allnotes() {
    _navigationService.navigateWithTransition(const AllnotesView(),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
  }

  void alljobs() {
    _navigationService.navigateWithTransition(const AlljobView(),
        routeName: Routes.alljobView, transitionStyle: Transition.rightToLeft);
  }

  void chatbot() {
    _navigationService.navigateWithTransition(ChatbotView(),
        routeName: Routes.chatbotView, transitionStyle: Transition.rightToLeft);
  }

  void lostandfound() {
    _navigationService.navigateWithTransition(LostandfoundView(),
        routeName: Routes.chatbotView, transitionStyle: Transition.rightToLeft);
  }

  void resource() {
    _navigationService.navigateWithTransition(ResourceView(),
        routeName: Routes.chatbotView, transitionStyle: Transition.rightToLeft);
  }

  void todolist() {
    _navigationService.navigateWithTransition(TodolistView(),
        routeName: Routes.chatbotView, transitionStyle: Transition.rightToLeft);
  }
}
