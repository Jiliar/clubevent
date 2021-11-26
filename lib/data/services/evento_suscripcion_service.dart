import 'dart:convert';
import 'package:clubevent/domain/models/evento_suscripcion_model.dart';
import 'package:clubevent/domain/services/generic_service.dart';
import 'package:http/http.dart' as http;


class EventoSuscripcionService implements GenericService {

  final String baseUrl = 'api.seatgeek.com';
  final String clientID = 'MjQ2MjkzMTF8MTYzNzg5NzcxOC43NDE4NzQy';

  @override
  Future<List<EventoSuscripcion>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'client_id': clientID};
    var uri = Uri.https(baseUrl, '/eventos_suscripciones', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<EventoSuscripcion> eventos_suscripciones = [];
      for (var evento_suscripcion in res['evento_suscripcion']) {
        eventos_suscripciones.add(EventoSuscripcion.fromJson(evento_suscripcion));
      }
      return eventos_suscripciones;
    } else {
      throw Exception('Error on request');
    }
  }

}