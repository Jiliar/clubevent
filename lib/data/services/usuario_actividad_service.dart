import 'dart:convert';
import 'package:clubevent/domain/models/usuario_actividad_model.dart';
import 'package:clubevent/domain/services/generic_service.dart';
import 'package:http/http.dart' as http;


class UsuarioActividadService implements GenericService {

  final String baseUrl = 'api.seatgeek.com';
  final String clientID = 'MjQ2MjkzMTF8MTYzNzg5NzcxOC43NDE4NzQy';

  @override
  Future<List<UsuarioActividad>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'client_id': clientID};
    var uri = Uri.https(baseUrl, '/usuario_actividades', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<UsuarioActividad> usuario_actividades = [];
      for (var usuario_actividad in res['usuario_actividad']) {
        usuario_actividades.add(UsuarioActividad.fromJson(usuario_actividad));
      }
      return usuario_actividades;
    } else {
      throw Exception('Error on request');
    }
  }

}