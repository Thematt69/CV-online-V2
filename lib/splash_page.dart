import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double get size {
    if (MediaQuery.of(context).size.width <
        MediaQuery.of(context).size.height) {
      return MediaQuery.of(context).size.width / 3;
    } else {
      return MediaQuery.of(context).size.height / 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size,
                width: size,
                child: const CircularProgressIndicator(),
              ),
              const SizedBox(height: CvSizes.px30),
              Text(
                translations.text(
                  'splash.get_data',
                  defaultText: 'Récupération des données en cours...',
                ),
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
