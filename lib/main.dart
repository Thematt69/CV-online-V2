import 'package:cv_online_v2/constants/theme_datas.dart';
import 'package:cv_online_v2/error_page.dart';
import 'package:cv_online_v2/helpers/shared_prefs_helper.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/main_page.dart';
import 'package:cv_online_v2/splash_page.dart';
import 'package:cv_online_v2/test.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey _keyError = GlobalKey();
  final GlobalKey _keySplash = GlobalKey();
  final GlobalKey _keyMain = GlobalKey();

  Future<String?> initialize() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      setPathUrlStrategy();
      await Firebase.initializeApp();
      await SharedPrefsHelper.initPreferences();
      await translations.init();
      Intl.defaultLocale = translations.deviceLang;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: initialize(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return MaterialApp(
            key: _keyError,
            title: 'CV en ligne - DEVILLIERS Matthieu',
            themeMode: ThemeMode.light,
            theme: lightTheme,
            home: ErrorPage(
              error: snapshot.data!,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            key: _keyMain,
            title: 'CV en ligne - DEVILLIERS Matthieu',
            themeMode: ThemeMode.light,
            theme: lightTheme,
            home: Test(),
            navigatorObservers: <NavigatorObserver>[MyApp.observer],
            supportedLocales: translations.supportedLocales,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: Locale(translations.deviceLang),
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              locale ??= defaultLocale;
              for (final supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
          );
        }
        return MaterialApp(
          key: _keySplash,
          title: 'CV en ligne - DEVILLIERS Matthieu',
          themeMode: ThemeMode.light,
          theme: lightTheme,
          home: const SplashPage(),
        );
      },
    );
  }
}
