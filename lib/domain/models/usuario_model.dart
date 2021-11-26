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
    DateTime fechaRegistro;


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
      required this.fechaRegistro
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
            fechaRegistro: DateTime.parse(map['fechaRegistro'])
        );
    }

}