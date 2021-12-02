import 'package:clubevent/domain/models/usuario.dart';
import 'package:clubevent/domain/models/evento.dart';

class UsuarioActividad{

  int guid;
  Evento evento;
  Usuario usuario;
  String tipo; //Feedback, Comment, Publish
  String imagen;
  String valor;
  int estado;
  DateTime fechaRegistro;
  String? dbRef;


  UsuarioActividad({
    required this.guid,
    required this.evento,
    required this.usuario,
    required this.tipo,
    required this.imagen,
    required this.valor,
    required this.estado,
    required this.fechaRegistro,
    this.dbRef
  });

  factory UsuarioActividad.fromJson(Map<String, dynamic> map) {
    final data = map["data"];
    return UsuarioActividad(
        guid: data['guid'],
        evento: data['evento'],
        usuario: data['usuario'],
        tipo: data['tipo'],
        imagen: data['imagen'],
        valor: data['valor'],
        estado: data['estado'],
        fechaRegistro: DateTime.parse(data['fechaRegistro'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "guid": guid,
      "evento": evento,
      "usuario": usuario,
      "tipo": tipo,
      "imagen": imagen,
      "valor": valor,
      "estado": estado,
      "fechaRegistro": fechaRegistro
    };
  }

}