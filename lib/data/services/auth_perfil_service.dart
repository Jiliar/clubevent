import 'dart:convert';
import 'package:clubevent/domain/models/auth_perfil_model.dart';
import 'package:clubevent/domain/services/generic_service.dart';
import 'package:http/http.dart' as http;


class AuthPerfilService implements GenericService {

  final String baseUrl = 'api.seatgeek.com';
  final String clientID = 'MjQ2MjkzMTF8MTYzNzg5NzcxOC43NDE4NzQy';

  @override
  Future<List<AuthPerfil>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'client_id': clientID};
    var uri = Uri.https(baseUrl, '/2/auth_perfiles', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<AuthPerfil> auth_perfiles = [];
      for (var auth_perfil in res['auth_perfil']) {
        auth_perfiles.add(AuthPerfil.fromJson(auth_perfil));
      }
      return auth_perfiles;
    } else {
      throw Exception('Error on request');
    }
  }

}