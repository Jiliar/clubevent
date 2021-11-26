import 'package:clubevent/domain/models/evento_model.dart';
import 'package:clubevent/domain/models/usuario_model.dart';

class EventoSuscripcion{

  int guid;
  Evento evento;
  Usuario usuario;
  DateTime fechaSuscripcion;

  EventoSuscripcion({
    required this.guid,
    required this.evento,
    required this.usuario,
    required this.fechaSuscripcion
  });

  factory EventoSuscripcion.fromJson(Map<String, dynamic> map) {
    return EventoSuscripcion(
        guid: map['guid'],
        evento: map['evento'],
        usuario: map['usuario'],
        fechaSuscripcion: map['fechaSuscripcion']
    );
  }

}