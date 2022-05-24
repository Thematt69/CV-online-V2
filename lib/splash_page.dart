import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double get _size {
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
                height: _size,
                width: _size,
                child: const CircularProgressIndicator(),
              ),
              const SizedBox(height: CvSizes.px30),
              Text(
                AppLocalizations.of(context)!.splash_getData,
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
