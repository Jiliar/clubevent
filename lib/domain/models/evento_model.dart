import 'package:clubevent/domain/models/usuario_model.dart';

class Evento{

  int guid;
  String nombre;
  String fecha;
  String direccion;
  int estado;
  Usuario usuarioCreador;
  DateTime fechaRegistro;

  Evento({
    required this.guid,
    required this.nombre,
    required this.fecha,
    required this.direccion,
    required this.estado,
    required this.usuarioCreador,
    required this.fechaRegistro
  });

  factory Evento.fromJson(Map<String, dynamic> map) {
    return Evento(
        guid: map['guid'],
        nombre: map['nombre'],
        fecha: map['fecha'],
        direccion: map['direccion'],
        estado:  map['estado'],
        usuarioCreador: map['usuarioCreador'],
        fechaRegistro: DateTime.parse(map['fechaRegistro'])
    );
  }

}