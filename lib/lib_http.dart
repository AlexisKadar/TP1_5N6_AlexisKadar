import 'package:dio/dio.dart';
import 'package:tp1_2363662/transfer.dart';

import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

final dio = Dio();
void getHttp() async {
  final response = await dio.get('https://dart.dev');
  print(response);
}

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