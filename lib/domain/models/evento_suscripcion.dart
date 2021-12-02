import 'package:clubevent/domain/models/evento.dart';
import 'package:clubevent/domain/models/usuario.dart';

class EventoSuscripcion{

  int guid;
  Evento evento;
  Usuario usuario;
  DateTime fechaSuscripcion;
  String? dbRef;

  EventoSuscripcion({
    required this.guid,
    required this.evento,
    required this.usuario,
    required this.fechaSuscripcion,
    this.dbRef
  });

  factory EventoSuscripcion.fromJson(Map<String, dynamic> map) {
    final data = map["data"];
    return EventoSuscripcion(
        guid: data['guid'],
        evento: data['evento'],
        usuario: data['usuario'],
        fechaSuscripcion: data['fechaSuscripcion']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "guid": guid,
      "evento": evento,
      "usuario": usuario,
      "fechaSuscripcion": fechaSuscripcion,
    };
  }

}