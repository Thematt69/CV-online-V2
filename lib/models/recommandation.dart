import 'package:equatable/equatable.dart';

import 'trap_map_model.dart';

class Recommandation extends Equatable {
  static const collectionName = 'recommandations';
  static const entryAuteur = 'auteur';
  static const entryEntreprise = 'entreprise';
  static const entryPoste = 'poste';
  static const entryText = 'text';

  final TradMapModel auteur;
  final TradMapModel entreprise;
  final TradMapModel poste;
  final TradMapModel texte;

  const Recommandation({
    required this.auteur,
    required this.entreprise,
    required this.poste,
    required this.texte,
  });

  @override
  String toString() {
    return 'Recommandation(auteur: $auteur, entreprise: $entreprise, poste: $poste, texte: $texte)';
  }

  Recommandation copyWith({
    TradMapModel? auteur,
    TradMapModel? entreprise,
    TradMapModel? poste,
    TradMapModel? texte,
  }) {
    return Recommandation(
      auteur: auteur ?? this.auteur,
      entreprise: entreprise ?? this.entreprise,
      poste: poste ?? this.poste,
      texte: texte ?? this.texte,
    );
  }

  factory Recommandation.fromFireStore(Map<String, dynamic> json) =>
      Recommandation(
        auteur: json[entryAuteur] is String
            ? TradMapModel.fromJsonString(json[entryAuteur] as String)
            : TradMapModel.fromJson(json[entryAuteur] as Map<String, dynamic>),
        entreprise: json[entryEntreprise] is String
            ? TradMapModel.fromJsonString(json[entryEntreprise] as String)
            : TradMapModel.fromJson(
                json[entryEntreprise] as Map<String, dynamic>,
              ),
        poste: json[entryPoste] is String
            ? TradMapModel.fromJsonString(json[entryPoste] as String)
            : TradMapModel.fromJson(json[entryPoste] as Map<String, dynamic>),
        texte: json[entryText] is String
            ? TradMapModel.fromJsonString(json[entryText] as String)
            : TradMapModel.fromJson(json[entryText] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        entryAuteur: auteur.toJson(),
        entryEntreprise: entreprise.toJson(),
        entryPoste: poste.toJson(),
        entryText: texte.toJson(),
      };

  @override
  List<Object> get props => [auteur, entreprise, poste, texte];
}
