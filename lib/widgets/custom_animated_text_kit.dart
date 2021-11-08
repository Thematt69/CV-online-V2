import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';

class CustomAnimatedTextKit extends StatelessWidget {
  const CustomAnimatedTextKit({
    Key? key,
    this.prefix = '',
    required this.textStyle,
    this.textAlign = TextAlign.center,
    this.duration = const Duration(milliseconds: 100),
  }) : super(key: key);

  final Duration duration;
  final String prefix;
  final TextAlign textAlign;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TypewriterAnimatedText(
          prefix + translations.text('custom_animated_text_kit.dev_flutter'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + translations.text('custom_animated_text_kit.gamers'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + translations.text('custom_animated_text_kit.dev_web'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + translations.text('custom_animated_text_kit.photographer'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + translations.text('custom_animated_text_kit.dev_android'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
