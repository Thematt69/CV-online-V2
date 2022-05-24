import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          prefix + AppLocalizations.of(context)!.animatedText_devFlutter,
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + AppLocalizations.of(context)!.animatedText_gamers,
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + AppLocalizations.of(context)!.animatedText_devWeb,
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + AppLocalizations.of(context)!.animatedText_photographer,
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
        TypewriterAnimatedText(
          prefix + AppLocalizations.of(context)!.animatedText_devAndroid,
          speed: duration,
          textStyle: textStyle,
          textAlign: textAlign,
        ),
      ],
    );
  }
}
