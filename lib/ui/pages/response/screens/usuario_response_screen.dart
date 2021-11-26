import 'package:clubevent/data/services/usuario_service.dart';
import 'package:clubevent/domain/models/usuario_actividad_model.dart';
import 'package:clubevent/domain/models/usuario_model.dart';
import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class UsuarioResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const UsuarioResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuarioService service = UsuarioService();
    Future<List<Usuario>> futureEvents = service.fecthData();
    return FutureBuilder<List<Usuario>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              Usuario usuario = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre: ${usuario.nombre}"),
                    Text("Apellido: ${usuario.apellido}"),
                    Text("Telefono: ${usuario.telefono}"),
                    Text("Correo: ${usuario.correo}"),
                    Text("Dirección: ${usuario.direccion}"),
                    Text("Ciudad: ${usuario.ciudad}"),
                    Text("País: ${usuario.pais}"),
                    Text("Estado: ${usuario.estado}"),
                    Text("Creado en: ${usuario.fecha_registro}"),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}