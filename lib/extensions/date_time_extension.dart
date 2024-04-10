import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  String yMMMd() => DateFormat.yMMMd().format(this);
  String yMMM() => DateFormat.yMMM().format(this);
}
