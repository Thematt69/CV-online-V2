import 'package:shared_preferences/shared_preferences.dart';

/// Helper class to use [SharedPreferences]
/// You need to use beforehand [SharedPrefsHelper.initPreferences()] to
/// start using the class's methods
class SharedPrefsHelper {
  static final instance = SharedPrefsHelper._internal();
  static SharedPreferences? _prefs;

  factory SharedPrefsHelper() => instance;

  SharedPrefsHelper._internal();

  /// Method to call in the `main.dart` before running the app.
  static Future<SharedPrefsHelper> initPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    return instance;
  }

  static String? get currentLang => getString('language');

  static Future<bool> setCurrentLang(String value) async {
    return setString('language', value);
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    if (_prefs == null) return false;
    return _prefs!.setString(key, value);
  }

  static Future<bool> remove(String key) async {
    if (_prefs == null) return false;
    return _prefs!.remove(key);
  }

  static Future<bool> clear() async {
    if (_prefs == null) return false;
    return _prefs!.clear();
  }
}
