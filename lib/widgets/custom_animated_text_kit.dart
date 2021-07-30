import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedTextKit extends StatelessWidget {
  final String prefix;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final Duration duration;

  const CustomAnimatedTextKit({
    Key? key,
    this.prefix = '',
    required this.textStyle,
    this.textAlign = TextAlign.center,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: const Duration(seconds: 1),
      animatedTexts: [
        TypewriterAnimatedText(
          prefix + 'Développeur Flutter',
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + 'Joueur amateur',
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + 'Développeur Web',
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + 'Photographe amateur',
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + 'Développeur Android',
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
