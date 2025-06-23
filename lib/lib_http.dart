import 'package:dio/dio.dart';
import 'package:tp1_2363662/transfer.dart';

import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';


class SingletonDio {
  static var cookieManager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookieManager);
    return dio;
  }

}

Future<ReponseConnexion> inscription(RequeteInscription req) async {
try{
  var reponse = await SingletonDio.getDio().post(
    "http://10.0.2.2:8080/id/inscription",
    data: req.toJson(),
  );
  print(reponse);
  return ReponseConnexion.fromJson(reponse.data);

} catch (e){
  print(e);
  throw(e);
}
}

Future<ReponseConnexion> connexion(RequeteConnexion req) async {
  try{
    var reponse = await SingletonDio.getDio().post(
      "http://10.0.2.2:8080/id/connexion",
      data: req.toJson(),
    );
    print(reponse);
    return ReponseConnexion.fromJson(reponse.data);

  } catch (e){
    print(e);
    throw(e);
  }
}

Future<void> ajoutTache(RequeteAjoutTache req) async {
 try {
  await SingletonDio.getDio().post(
    "http://10.0.2.2:8080/tache/ajout",
    data: req.toJson(),
  );

} catch (e){
print(e);
throw(e);
}
}

Future<List<ReponseAccueilItemAvecPhoto>> accueil() async {
  try {
    var reponse = await SingletonDio.getDio().get(
      "http://10.0.2.2:8080/api/accueil/photo"
    );

    return (reponse.data as List)
        .map((item) => ReponseAccueilItemAvecPhoto.fromJson(item))
        .toList();

  } catch (e){
    print(e);
    throw(e);
  }
}

  Future<ReponseDetailTacheAvecPhoto> consultation(int id) async {
  try {
    var reponse = await SingletonDio.getDio().get(
        "http://10.0.2.2:8080/api/detail/photo/$id"
    );

    return ReponseDetailTacheAvecPhoto.fromJson(reponse.data);

  } catch (e){
    print(e);
    throw(e);
  }
}

Future<void> updateProgress(int id, int valeur) async {
  try {
    var reponse = await SingletonDio.getDio().get(
        "http://10.0.2.2:8080/tache/progres/$id/$valeur"
    );

  } catch (e){
    print(e);
    throw(e);
  }
}

Future<void> deconnexion() async {
  try {
    await SingletonDio.getDio().post(
        "http://10.0.2.2:8080/id/deconnexion"
    );

  } catch (e){
    print(e);
    throw(e);
  }
}


