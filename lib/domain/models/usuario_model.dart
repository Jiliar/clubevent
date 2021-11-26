class Usuario{

    int guid;
    String nombre;
    String apellido;
    String telefono;
    String correo;
    String direccion;
    String ciudad;
    String pais;
    int estado;
    DateTime fecha_registro;


  Usuario({
      required this.guid,
      required this.nombre,
      required this.apellido,
      required this.telefono,
      required this.correo,
      required this.direccion,
      required this.ciudad,
      required this.pais,
      required this.estado,
      required this.fecha_registro
  });

    factory Usuario.fromJson(Map<String, dynamic> map) {
        return Usuario(
            guid: map['guid'],
            nombre: map['nombre'],
            apellido: map['apellido'],
            telefono: map['telefono'],
            correo: map['correo'],
            direccion: map['direccion'],
            ciudad: map['ciudad'],
            pais: map['pais'],
            estado: map['estado'],
            fecha_registro: DateTime.parse(map['fecha_registro'])
        );
    }

}