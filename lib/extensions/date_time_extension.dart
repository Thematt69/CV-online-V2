import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String yMMMd(BuildContext context) =>
      DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(this);
  String yMMM(BuildContext context) =>
      DateFormat.yMMM(Localizations.localeOf(context).languageCode)
          .format(this);
}
