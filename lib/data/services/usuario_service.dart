import 'dart:convert';
import 'package:clubevent/domain/models/usuario_model.dart';
import 'package:clubevent/domain/services/generic_service.dart';
import 'package:http/http.dart' as http;


class UsuarioService implements GenericService {

  final String baseUrl = 'api.seatgeek.com';
  final String clientID = 'MjQ2MjkzMTF8MTYzNzg5NzcxOC43NDE4NzQy';

  @override
  Future<List<Usuario>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'client_id': clientID};
    var uri = Uri.https(baseUrl, '/usuarios', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<Usuario> usuarios = [];
      for (var usuario in res['usuario']) {
        usuarios.add(Usuario.fromJson(usuario));
      }
      return usuarios;
    } else {
      throw Exception('Error on request');
    }
  }

}