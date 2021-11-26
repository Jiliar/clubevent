import 'package:clubevent/domain/models/evento_model.dart';
import 'package:clubevent/domain/models/usuario_model.dart';

class EventoSuscripcion{

  int guid;
  Evento evento;
  Usuario usuario;
  DateTime fecha_suscripcion;

  EventoSuscripcion({
    required this.guid,
    required this.evento,
    required this.usuario,
    required this.fecha_suscripcion
  });

  factory EventoSuscripcion.fromJson(Map<String, dynamic> map) {
    return EventoSuscripcion(
        guid: map['guid'],
        evento: map['evento'],
        usuario: map['usuario'],
        fecha_suscripcion: map['fecha_suscripcion']
    );
  }

}