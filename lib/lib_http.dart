import 'package:dio/dio.dart';
import 'package:tp1_2363662/transfer.dart';

final dio = Dio();
void getHttp() async {
  final response = await dio.get('https://dart.dev');
  print(response);
}

Future<ReponseConnexion> inscription(RequeteInscription req) async {
try{
  var reponse = await Dio().post(
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