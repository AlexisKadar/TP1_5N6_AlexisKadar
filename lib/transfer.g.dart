// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequeteInscription _$RequeteInscriptionFromJson(Map<String, dynamic> json) =>
    RequeteInscription()
      ..nom = json['nom'] as String
      ..motDePasse = json['motDePasse'] as String
      ..confirmationMotDePasse = json['confirmationMotDePasse'] as String;

Map<String, dynamic> _$RequeteInscriptionToJson(RequeteInscription instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'motDePasse': instance.motDePasse,
      'confirmationMotDePasse': instance.confirmationMotDePasse,
    };

ReponseConnexion _$ReponseConnexionFromJson(Map<String, dynamic> json) =>
    ReponseConnexion()..nomUtilisateur = json['nomUtilisateur'] as String;

Map<String, dynamic> _$ReponseConnexionToJson(ReponseConnexion instance) =>
    <String, dynamic>{'nomUtilisateur': instance.nomUtilisateur};

RequeteConnexion _$RequeteConnexionFromJson(Map<String, dynamic> json) =>
    RequeteConnexion()
      ..nom = json['nom'] as String
      ..motDePasse = json['motDePasse'] as String;

Map<String, dynamic> _$RequeteConnexionToJson(RequeteConnexion instance) =>
    <String, dynamic>{'nom': instance.nom, 'motDePasse': instance.motDePasse};

RequeteAjoutTache _$RequeteAjoutTacheFromJson(Map<String, dynamic> json) =>
    RequeteAjoutTache()
      ..nom = json['nom'] as String
      ..dateLimite = _fromJson(json['dateLimite'] as String);

Map<String, dynamic> _$RequeteAjoutTacheToJson(RequeteAjoutTache instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'dateLimite': _toJson(instance.dateLimite),
    };

ReponseAccueilItem _$ReponseAccueilItemFromJson(Map<String, dynamic> json) =>
    ReponseAccueilItem()
      ..nom = json['nom'] as String
      ..id = (json['id'] as num).toInt()
      ..pourcentageAvancement = (json['pourcentageAvancement'] as num).toInt()
      ..pourcentageTemps = (json['pourcentageTemps'] as num).toInt()
      ..dateLimite = _fromJson(json['dateLimite'] as String);

Map<String, dynamic> _$ReponseAccueilItemToJson(ReponseAccueilItem instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'id': instance.id,
      'pourcentageAvancement': instance.pourcentageAvancement,
      'pourcentageTemps': instance.pourcentageTemps,
      'dateLimite': _toJson(instance.dateLimite),
    };

ReponseAccueilItemAvecPhoto _$ReponseAccueilItemAvecPhotoFromJson(
  Map<String, dynamic> json,
) => ReponseAccueilItemAvecPhoto()
  ..nom = json['nom'] as String
  ..id = (json['id'] as num).toInt()
  ..pourcentageAvancement = (json['pourcentageAvancement'] as num).toInt()
  ..pourcentageTemps = (json['pourcentageTemps'] as num).toInt()
  ..dateLimite = _fromJson(json['dateLimite'] as String)
  ..idPhoto = (json['idPhoto'] as num).toInt();

Map<String, dynamic> _$ReponseAccueilItemAvecPhotoToJson(
  ReponseAccueilItemAvecPhoto instance,
) => <String, dynamic>{
  'nom': instance.nom,
  'id': instance.id,
  'pourcentageAvancement': instance.pourcentageAvancement,
  'pourcentageTemps': instance.pourcentageTemps,
  'dateLimite': _toJson(instance.dateLimite),
  'idPhoto': instance.idPhoto,
};

ReponseDetailTache _$ReponseDetailTacheFromJson(Map<String, dynamic> json) =>
    ReponseDetailTache()
      ..id = (json['id'] as num).toInt()
      ..nom = json['nom'] as String
      ..dateLimite = _fromJson(json['dateLimite'] as String)
      ..pourcentageAvancement = (json['pourcentageAvancement'] as num).toInt()
      ..pourcentageTemps = (json['pourcentageTemps'] as num).toInt();

Map<String, dynamic> _$ReponseDetailTacheToJson(ReponseDetailTache instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.nom,
      'dateLimite': _toJson(instance.dateLimite),
      'pourcentageAvancement': instance.pourcentageAvancement,
      'pourcentageTemps': instance.pourcentageTemps,
    };

ReponseDetailTacheAvecPhoto _$ReponseDetailTacheAvecPhotoFromJson(
  Map<String, dynamic> json,
) => ReponseDetailTacheAvecPhoto()
  ..id = (json['id'] as num).toInt()
  ..nom = json['nom'] as String
  ..dateLimite = _fromJson(json['dateLimite'] as String)
  ..pourcentageAvancement = (json['pourcentageAvancement'] as num).toInt()
  ..pourcentageTemps = (json['pourcentageTemps'] as num).toInt()
  ..photoId = (json['photoId'] as num).toInt();

Map<String, dynamic> _$ReponseDetailTacheAvecPhotoToJson(
  ReponseDetailTacheAvecPhoto instance,
) => <String, dynamic>{
  'id': instance.id,
  'nom': instance.nom,
  'dateLimite': _toJson(instance.dateLimite),
  'pourcentageAvancement': instance.pourcentageAvancement,
  'pourcentageTemps': instance.pourcentageTemps,
  'photoId': instance.photoId,
};
