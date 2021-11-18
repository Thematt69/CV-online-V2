import 'package:cv_online_v2/helpers/shared_prefs_helper.dart';
import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String get yMMMd =>
      DateFormat.yMMMd(SharedPrefsHelper.currentLang).format(this);
  String get yMMM =>
      DateFormat.yMMM(SharedPrefsHelper.currentLang).format(this);
}
