import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:cv_online_v2/helpers/shared_prefs_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const List<String> _kSupportedLanguages = ['fr', 'en'];
const Locale defaultLocale = Locale('en');

CustomLocalizations translations = CustomLocalizations();

class CustomLocalizations {
  Map<String, dynamic>? _localizedValues;
  String currentLanguage = '';
  final Map<String, String> _cache = {};

  static final CustomLocalizations _instance = CustomLocalizations._internal();

  factory CustomLocalizations() => _instance;

  CustomLocalizations._internal();

  Future<void> init() async {
    String language = SharedPrefsHelper.currentLang ?? "";
    if (language.isEmpty) language = deviceLang;
    await setNewLanguage(
      isLangSupported(language) ? language : defaultLocale.languageCode,
    );
  }

  String text(String key, {String? defaultText}) {
    String string = defaultText ?? '/!\\ missing "$key" translation /!\\';

    if (_localizedValues != null) {
      // Check if the requested [key] is in the cache
      if (_cache.containsKey(key)) return _cache[key] ?? string;

      // Iterate the key until found or not
      bool found = true;
      Map<String, dynamic>? _values = _localizedValues;
      final List<String> _keyParts = key.split('.');
      final int _keyPartsLen = _keyParts.length;
      int index = 0;
      final int lastIndex = _keyPartsLen - 1;

      while (index < _keyPartsLen && found) {
        final value = _values![_keyParts[index]];

        if (value == null) {
          // Not found => STOP
          found = false;
          break;
        }

        // Check if we found the requested key
        if (value is String && index == lastIndex) {
          string = value;

          // Add to cache
          _cache[key] = string;
          break;
        }

        // go to next subKey
        _values = value as Map<String, dynamic>?;
        index++;
      }
    }
    return string;
  }

  List<Locale> get supportedLocales =>
      _kSupportedLanguages.map<Locale>((e) => Locale(e)).toList();

  bool isLangSupported(String language) =>
      _kSupportedLanguages.contains(language);

  bool isLocaleSupported(Locale locale) => supportedLocales.contains(locale);

  String get deviceLang {
    if (kIsWeb) {
      String currentLocale = '';
      final List<Locale> systemLocales =
          WidgetsBinding.instance?.window.locales ?? [];
      if (systemLocales.isNotEmpty) {
        currentLocale =
            "${systemLocales.first.languageCode}_${systemLocales.first.countryCode}";
      }
      debugPrint('DEVICE LANGUAGE: $currentLocale');
      if (currentLocale.length > 2) return currentLocale.substring(0, 2);
      return currentLocale;
    } else {
      final currentLocale = Platform.localeName.toLowerCase();
      debugPrint('DEVICE LANGUAGE: $currentLocale');
      if (currentLocale.length > 2) return currentLocale.substring(0, 2);
      return currentLocale;
    }
  }

  Future<void> setNewLanguage(String language) async {
    final jsonContent =
        await rootBundle.loadString('assets/l10n/$language.json', cache: false);
    _localizedValues = jsonDecode(jsonContent) as Map<String, dynamic>?;

    _cache.clear();
    await SharedPrefsHelper.setCurrentLang(language);

    currentLanguage = language;
  }
}
