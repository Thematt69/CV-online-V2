import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String error;

  const ErrorPage({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                translations.text(
                  'error.no_init',
                  defaultText:
                      "Il semblerait que l'application n'ait pas pu se lancer correctement.",
                ),
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CvSizes.px10),
              Text(
                translations.text(
                  'error.contact',
                  defaultText:
                      'Contactez le support en mentionnant le message inscrit ci-dessous.',
                ),
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CvSizes.px30),
              Text(
                error,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
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
