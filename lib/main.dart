import 'dart:async';

import 'package:cv_online_v2/constants/theme_datas.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/error_page.dart';
import 'package:cv_online_v2/main_page.dart';
import 'package:cv_online_v2/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_strategy/url_strategy.dart';

List<LocalizationsDelegate<Object>> _localizationsDelegates = const [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
List<Locale> _supportedLocales = const [
  Locale('fr', ''), // French, no country code
  Locale('en', ''), // English, no country code
];

void main() async {
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    runApp(
      BlocProvider(
        key: GlobalKey(),
        blocs: [FirestoreBloc()],
        child: const MyApp(),
      ),
    );
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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

      await FirebaseAuth.instance.signInAnonymously();

      await BlocProvider.master<FirestoreBloc>().initFirestore();

      return null;
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
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: CvThemeDatas.lightTheme,
            home: ErrorPage(
              error: snapshot.data!,
            ),
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _supportedLocales,
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            key: _keyMain,
            title: 'CV en ligne - DEVILLIERS Matthieu',
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            theme: CvThemeDatas.lightTheme,
            home: const MainPage(),
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _supportedLocales,
          );
        }
        return MaterialApp(
          key: _keySplash,
          title: 'CV en ligne - DEVILLIERS Matthieu',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: CvThemeDatas.lightTheme,
          home: const SplashPage(),
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _supportedLocales,
        );
      },
    );
  }
}
