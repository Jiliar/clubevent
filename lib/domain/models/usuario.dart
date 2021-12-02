class Usuario{

    int guid;
    String nombre;
    String apellido;
    String telefono;
    String email;
    String direccion;
    String ciudad;
    String pais;
    String pictureUrl;
    int estado;
    DateTime fechaRegistro;
    String? dbRef;


  Usuario({
      required this.guid,
      required this.nombre,
      required this.apellido,
      required this.telefono,
      required this.email,
      required this.direccion,
      required this.ciudad,
      required this.pais,
      required this.pictureUrl,
      required this.estado,
      required this.fechaRegistro,
      this.dbRef
  });

    factory Usuario.fromJson(Map<String, dynamic> map) {
        final data = map["data"];
        return Usuario(
            guid: data['guid'],
            nombre: data['nombre'],
            apellido: data['apellido'],
            telefono: data['telefono'],
            email: data['email'],
            direccion: data['direccion'],
            ciudad: data['ciudad'],
            pais: data['pais'],
            pictureUrl: data['pictureUrl'],
            estado: data['estado'],
            fechaRegistro: DateTime.parse(data['fechaRegistro'])
        );
    }

    Map<String, dynamic> toJson() {
        return {
            "guid": guid,
            "nombre": nombre,
            "apellido": apellido,
            "telefono": telefono,
            "email": email,
            "direccion": direccion,
            "ciudad": ciudad,
            "pais": pais,
            "pictureUrl": pictureUrl,
            "estado": estado,
            "fechaRegistro": fechaRegistro
        };
    }

}