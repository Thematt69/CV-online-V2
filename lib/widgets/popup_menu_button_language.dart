import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonLanguage extends StatelessWidget {
  const PopupMenuButtonLanguage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
        ),
        child: PopupMenuButton<Locale>(
          tooltip:
              translations.text('popup_menu_button_language.change_langue'),
          icon: const Icon(Icons.translate),
          onSelected: (value) async {
            if (value.languageCode != translations.currentLanguage) {
              await translations.setNewLanguage(value.languageCode);
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: Text(
                    translations
                        .text('popup_menu_button_language.refresh_recommend'),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  content: Text(
                    translations.text(
                      'popup_menu_button_language.refresh_recommend_content',
                    ),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          itemBuilder: (context) {
            return List.generate(
              translations.supportedLocales.length,
              (index) => PopupMenuItem<Locale>(
                value: translations.supportedLocales[index],
                child: Text(
                  translations.supportedLocales[index].languageCode
                      .toUpperCase(),
                  style: translations.currentLanguage ==
                          translations.supportedLocales[index].languageCode
                      ? Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          )
                      : Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                          ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
