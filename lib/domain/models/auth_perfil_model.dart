class AuthPerfil{

  int guid;
  String nombre;
  String descripcion;
  int estado;
  DateTime fecha_registro;

  AuthPerfil({
    required this.guid,
    required this.nombre,
    required this.descripcion,
    required this.estado,
    required this.fecha_registro
  });

  factory AuthPerfil.fromJson(Map<String, dynamic> map) {
    return AuthPerfil(
        guid: map['guid'],
        nombre: map['nombre'],
        descripcion: map['descripcion'],
        estado:  map['estado'],
        fecha_registro: DateTime.parse(map['fecha_registro'])
    );
  }


}