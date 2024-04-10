import 'package:cv_online_v2/constants/theme_datas.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/error_page.dart';
import 'package:cv_online_v2/main_page.dart';
import 'package:cv_online_v2/splash_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String?> initialize() async {
    try {
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
        Widget home = const SplashPage();
        if (snapshot.data != null) {
          home = ErrorPage(error: snapshot.data!);
        } else if (snapshot.connectionState == ConnectionState.done) {
          home = const MainPage();
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CV en ligne - DEVILLIERS Matthieu',
          themeMode: ThemeMode.light,
          theme: CvThemeDatas.lightTheme,
          home: home,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
