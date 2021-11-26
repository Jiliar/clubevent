class AuthPerfil{

  int guid;
  String nombre;
  String descripcion;
  int estado;
  DateTime fechaRegistro;

  AuthPerfil({
    required this.guid,
    required this.nombre,
    required this.descripcion,
    required this.estado,
    required this.fechaRegistro
  });

  factory AuthPerfil.fromJson(Map<String, dynamic> map) {
    return AuthPerfil(
        guid: map['guid'],
        nombre: map['nombre'],
        descripcion: map['descripcion'],
        estado:  map['estado'],
        fechaRegistro: DateTime.parse(map['fechaRegistro'])
    );
  }


}