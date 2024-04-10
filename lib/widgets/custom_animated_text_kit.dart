import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAnimatedTextKit extends StatelessWidget {
  const CustomAnimatedTextKit({
    super.key,
    this.prefix = '',
    required this.textStyle,
    this.textAlign = TextAlign.center,
    this.duration = const Duration(milliseconds: 100),
  });

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
          prefix + tr('animatedText_devFlutter'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + tr('animatedText_gamers'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + tr('animatedText_devWeb'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + tr('animatedText_photographer'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + tr('animatedText_devAndroid'),
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
