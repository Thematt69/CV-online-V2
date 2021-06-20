import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedTextKit extends StatelessWidget {
  const CustomAnimatedTextKit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 100,
      pause: const Duration(seconds: 1),
      animatedTexts: [
        TypewriterAnimatedText(
          'Développeur Flutter',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Joueur amateur',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Développeur Web',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Photographe amateur',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Développeur Android',
          speed: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
