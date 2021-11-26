import 'package:clubevent/data/services/auth_usuario_service.dart';
import 'package:clubevent/domain/models/auth_usuario_model.dart';
import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class AuthUsuarioResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const AuthUsuarioResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthUsuarioService service = AuthUsuarioService();
    Future<List<AuthUsuario>> futureEvents = service.fecthData();
    return FutureBuilder<List<AuthUsuario>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              AuthUsuario usuario = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nickname: ${usuario.apodo}"),
                    Text("Password: ${usuario.password}"),
                    Text("Usuario: ${usuario.usuario.nombre+' '+usuario.usuario.apellido}"),
                    Text("Perfil: ${usuario.perfil.nombre}"),
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