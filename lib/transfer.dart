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