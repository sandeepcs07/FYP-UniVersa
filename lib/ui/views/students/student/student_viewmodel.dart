import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unievents/ui/views/common/addnotes/addnotes_view.dart';
import 'package:unievents/ui/views/common/chatbot/chatbot_view.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/sharedpref_service.dart';
import '../../../common/app_colors.dart';
import '../../auth/login/login_view.dart';
import '../../common/addevents/addevents_view.dart';
import '../../common/addjob/addjob_view.dart';
import '../../common/addtimetable/addtimetable_view.dart';
import '../../common/allevents/allevents_view.dart';
import '../../common/alltimetable/alltimetable_view.dart';

class StudentViewModel extends BaseViewModel {
  List<SalomonBottomBarItem> bottomcontents = [
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.home_outlined,
        color: white,
      ),
      activeIcon: const Icon(
        Icons.home,
        color: black,
      ),
      title: Text(
        "Home",
        style: GoogleFonts.montserrat(color: black),
      ),
      selectedColor: white,
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.chat,
        color: white,
      ),
      activeIcon: const Icon(
        Icons.chat,
        color: black,
      ),
      title: Text(
        "Chats",
        style: GoogleFonts.montserrat(color: black),
      ),
      selectedColor: white,
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        Iconsax.car,
        color: white,
      ),
      activeIcon: const Icon(
        Iconsax.car,
        color: black,
      ),
      title: Text(
        "Carpool",
        style: GoogleFonts.montserrat(color: black),
      ),
      selectedColor: white,
    ),
    SalomonBottomBarItem(
      icon: const Icon(
        Icons.shopping_cart,
        color: white,
      ),
      activeIcon: const Icon(
        Icons.shopping_cart,
        color: black,
      ),
      title: Text(
        "Market",
        style: GoogleFonts.montserrat(color: black),
      ),
      selectedColor: white,
    ),
  ];

  int currentIndex = 0;
  void updateindex(int index) {
    currentIndex = index;
    notifyListeners();
  }

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

  void addnotes() {
    _navigationService.navigateWithTransition(AddnotesView(),
        routeName: Routes.addeventsView,
        transitionStyle: Transition.rightToLeft);
  }
}
