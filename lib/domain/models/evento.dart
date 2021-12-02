import 'package:clubevent/domain/models/usuario.dart';

class Evento{

  int guid;
  String nombre;
  String fecha;
  String direccion;
  int estado;
  Usuario usuarioCreador;
  DateTime fechaRegistro;
  String? dbRef;

  Evento({
    required this.guid,
    required this.nombre,
    required this.fecha,
    required this.direccion,
    required this.estado,
    required this.usuarioCreador,
    required this.fechaRegistro,
    this.dbRef
  });

  factory Evento.fromJson(Map<String, dynamic> map) {
    final data = map["data"];
    return Evento(
        guid: data['guid'],
        nombre: data['nombre'],
        fecha: data['fecha'],
        direccion: data['direccion'],
        estado:  data['estado'],
        usuarioCreador: data['usuarioCreador'],
        fechaRegistro: DateTime.parse(data['fechaRegistro'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "guid": guid,
      "nombre": nombre,
      "fecha": fecha,
      "direccion": direccion,
      "estado": estado,
      "usuarioCreador": usuarioCreador,
      "fechaRegistro": fechaRegistro,
    };
  }

}