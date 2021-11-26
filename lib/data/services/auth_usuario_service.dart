import 'dart:convert';
import 'package:clubevent/domain/models/auth_usuario_model.dart';
import 'package:clubevent/domain/services/generic_service.dart';
import 'package:http/http.dart' as http;


class AuthUsuarioService implements GenericService {

  final String baseUrl = 'api.seatgeek.com';
  final String clientID = 'MjQ2MjkzMTF8MTYzNzg5NzcxOC43NDE4NzQy';

  @override
  Future<List<AuthUsuario>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'client_id': clientID};
    var uri = Uri.https(baseUrl, '/auth_usuarios', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<AuthUsuario> authUsuarios = [];
      for (var authUsuario in res['auth_usuario']) {
        authUsuarios.add(AuthUsuario.fromJson(authUsuario));
      }
      return authUsuarios;
    } else {
      throw Exception('Error on request');
    }
  }

}