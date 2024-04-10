import 'dart:async';

import 'package:cv_online_v2/app.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(
      BlocProvider(
        key: GlobalKey(),
        blocs: [FirestoreBloc()],
        child: EasyLocalization(
          supportedLocales: const [
            Locale('fr', 'FR'),
            Locale('en', ''),
          ],
          path: 'assets/l10n',
          fallbackLocale: const Locale('fr', "FR"),
          child: Builder(
            builder: (context) {
              Intl.defaultLocale = context.locale.languageCode;

              return const MyApp();
            },
          ),
        ),
      ),
    );
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
  });
}
