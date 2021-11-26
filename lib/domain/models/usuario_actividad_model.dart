import 'package:clubevent/domain/models/usuario_model.dart';
import 'package:clubevent/domain/models/evento_model.dart';

class UsuarioActividad{

  int guid;
  Evento evento;
  Usuario usuario;
  String tipo; //Feedback, Comment, Publish
  String imagen;
  String valor;
  int estado;
  DateTime fechaRegistro;


  UsuarioActividad({
    required this.guid,
    required this.evento,
    required this.usuario,
    required this.tipo,
    required this.imagen,
    required this.valor,
    required this.estado,
    required this.fechaRegistro
  });

  factory UsuarioActividad.fromJson(Map<String, dynamic> map) {
    return UsuarioActividad(
        guid: map['guid'],
        evento: map['evento'],
        usuario: map['usuario'],
        tipo: map['tipo'],
        imagen: map['imagen'],
        valor: map['valor'],
        estado: map['estado'],
        fechaRegistro: DateTime.parse(map['fechaRegistro'])
    );
  }
}