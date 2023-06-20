import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_strategy/url_strategy.dart';

import 'constants/theme_datas.dart';
import 'controllers/bloc_provider.dart';
import 'controllers/firestore_bloc.dart';
import 'error_page.dart';
import 'firebase_options.dart';
import 'main_page.dart';
import 'splash_page.dart';

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
  const MyApp({super.key});

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

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

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
            debugShowCheckedModeBanner: false,
            key: _keyError,
            title: 'CV en ligne - DEVILLIERS Matthieu',
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
            debugShowCheckedModeBanner: false,
            key: _keyMain,
            title: 'CV en ligne - DEVILLIERS Matthieu',
            themeMode: ThemeMode.light,
            theme: CvThemeDatas.lightTheme,
            home: const MainPage(),
            localizationsDelegates: _localizationsDelegates,
            supportedLocales: _supportedLocales,
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          key: _keySplash,
          title: 'CV en ligne - DEVILLIERS Matthieu',
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
