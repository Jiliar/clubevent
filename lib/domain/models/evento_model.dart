import 'package:clubevent/domain/models/usuario_model.dart';

class Evento{

  int guid;
  String nombre;
  String fecha;
  String direccion;
  int estado;
  Usuario usuario_creador;
  DateTime fecha_registro;

  Evento({
    required this.guid,
    required this.nombre,
    required this.fecha,
    required this.direccion,
    required this.estado,
    required this.usuario_creador,
    required this.fecha_registro
  });

  factory Evento.fromJson(Map<String, dynamic> map) {
    return Evento(
        guid: map['guid'],
        nombre: map['nombre'],
        fecha: map['fecha'],
        direccion: map['direccion'],
        estado:  map['estado'],
        usuario_creador: map['usuario_creador'],
        fecha_registro: DateTime.parse(map['fecha_registro'])
    );
  }

}