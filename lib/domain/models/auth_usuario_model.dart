import 'package:clubevent/domain/models/usuario_model.dart';
import 'package:clubevent/domain/models/auth_perfil_model.dart';

class AuthUsuario{

  int guid;
  String apodo;
  String password;
  Usuario usuario;
  AuthPerfil perfil;
  int estado;
  DateTime fecha_registro;

  AuthUsuario({
    required this.guid,
    required this.apodo,
    required this.password,
    required this.usuario,
    required this.perfil,
    required this.estado,
    required this.fecha_registro
  });


  factory AuthUsuario.fromJson(Map<String, dynamic> map) {
    return AuthUsuario(
        guid: map['guid'],
        apodo: map['apodo'],
        password: map['password'],
        usuario: map['usuario'],
        estado:  map['estado'],
        perfil: map['perfil'],
        fecha_registro: DateTime.parse(map['fecha_registro'])
    );
  }

}