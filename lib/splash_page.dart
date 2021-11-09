import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:flutter/material.dart';

import 'localization/localization.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  double get size {
    if (MediaQuery.of(context).size.width <
        MediaQuery.of(context).size.height) {
      return MediaQuery.of(context).size.width / 2;
    } else {
      return MediaQuery.of(context).size.height / 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkLightColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, Widget? _widget) {
                  return Transform.rotate(
                    angle: animationController.value * 6.3,
                    child: Image.asset(
                      assetLogoTr512,
                      fit: BoxFit.cover,
                      width: size,
                      height: size,
                      frameBuilder: (_, child, __, wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded) {
                          return SizedBox(
                            width: size,
                            height: size,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        return child;
                      },
                      errorBuilder: (_, __, ___) => const SizedBox(),
                    ),
                  );
                },
              ),
              Text(
                translations.text(
                  'splash.get_data',
                  defaultText: "Récupération des données en cours...",
                ),
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
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
