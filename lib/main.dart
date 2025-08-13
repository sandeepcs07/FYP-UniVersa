import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unievents/app/app.bottomsheets.dart';
import 'package:unievents/app/app.dialogs.dart';
import 'package:unievents/app/app.locator.dart';
import 'package:unievents/app/app.router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:stacked_services/stacked_services.dart';

import 'firebase_options.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification!.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                playSound: true, icon: '@mipmap/ic_launcher'),
          ));
    }
  });

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  Animate.restartOnHotReload = true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: FlexThemeData.light(
        scheme: FlexScheme.blue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 10,
        appBarOpacity: 1,
        lightIsWhite: false,
        appBarElevation: 10,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          splashType: FlexSplashType.inkRipple,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.blue,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 20,
        darkIsTrueBlack: false,
        appBarOpacity: 1,
        appBarElevation: 10,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          splashType: FlexSplashType.inkRipple,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      themeMode: ThemeMode.system,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
