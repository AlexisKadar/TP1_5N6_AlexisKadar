import 'dart:ffi';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';


part 'transfer.g.dart';


@JsonSerializable()
class RequeteInscription {

  RequeteInscription();

  String nom = "";

  String motDePasse = "";

  String confirmationMotDePasse = "";


  factory RequeteInscription.fromJson(Map<String, dynamic> json) => _$RequeteInscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$RequeteInscriptionToJson(this);
}

@JsonSerializable()
class ReponseConnexion {

  ReponseConnexion();

  String nomUtilisateur = "";


  factory ReponseConnexion.fromJson(Map<String, dynamic> json) => _$ReponseConnexionFromJson(json);

  Map<String, dynamic> toJson() => _$ReponseConnexionToJson(this);
}

@JsonSerializable()
class RequeteConnexion  {

  RequeteConnexion();

  String nom = "";

  String motDePasse = "";


  factory RequeteConnexion.fromJson(Map<String, dynamic> json) => _$RequeteConnexionFromJson(json);

  Map<String, dynamic> toJson() => _$RequeteConnexionToJson(this);
}

@JsonSerializable()
class RequeteAjoutTache  {

  RequeteAjoutTache();

  String nom = "";

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateLimite = DateTime.now();


  factory RequeteAjoutTache.fromJson(Map<String, dynamic> json) => _$RequeteAjoutTacheFromJson(json);

  Map<String, dynamic> toJson() => _$RequeteAjoutTacheToJson(this);
}

@JsonSerializable()
class ReponseAccueilItem  {

  ReponseAccueilItem();

  String nom = "";

  int id = 0;

  int pourcentageAvancement = 0;

  int pourcentageTemps = 0;

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateLimite = DateTime.now();


  factory ReponseAccueilItem.fromJson(Map<String, dynamic> json) => _$ReponseAccueilItemFromJson(json);

  Map<String, dynamic> toJson() => _$ReponseAccueilItemToJson(this);
}


@JsonSerializable()
class ReponseDetailTache {

  ReponseDetailTache();

  int id = 0;

  String nom = "";

  @JsonKey(fromJson: _fromJson, toJson: _toJson)
  DateTime dateLimite = DateTime.now();

  int pourcentageAvancement = 0;

  int pourcentageTemps = 0;

  factory ReponseDetailTache.fromJson(Map<String, dynamic> json) => _$ReponseDetailTacheFromJson(json);

  Map<String, dynamic> toJson() => _$ReponseDetailTacheToJson(this);
}


final _dateFormatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");

DateTime _fromJson(String date) => _dateFormatter.parse(date);

String _toJson(DateTime date) => _dateFormatter.format(date);