import 'package:cv_online_v2/helpers/shared_prefs_helper.dart';
import 'package:equatable/equatable.dart';

class TradMapModel extends Equatable {
  static const entryEnUS = 'en_US';
  static const entryFrFR = 'fr_FR';

  final String? enUS;
  final String frFR;

  const TradMapModel({
    this.enUS,
    required this.frFR,
  });

  factory TradMapModel.fromJson(Map<String, dynamic> json) => TradMapModel(
        enUS: json[entryEnUS] as String?,
        frFR: json[entryFrFR] as String,
      );

  factory TradMapModel.fromJsonString(String json) => TradMapModel(frFR: json);

  Map<String, dynamic> toJson() => {
        entryEnUS: enUS,
        entryFrFR: frFR,
      };

  String get currentLang => _tradFromLangCode(SharedPrefsHelper.currentLang);

  String _tradFromLangCode(String? languageCode) {
    final tradMap = <String, String?>{
      'en': enUS,
      'fr': frFR,
    };
    return tradMap[languageCode] != null && tradMap[languageCode]!.isNotEmpty
        ? tradMap[languageCode]!.replaceAll('<br>', '\n')
        : enUS != null && enUS!.isNotEmpty
            ? enUS!.replaceAll('<br>', '\n')
            : frFR.replaceAll('<br>', '\n');
  }

  @override
  String toString() => '{enUS: $enUS, frFR: $frFR}';

  @override
  List<Object?> get props => [enUS, frFR];
}
