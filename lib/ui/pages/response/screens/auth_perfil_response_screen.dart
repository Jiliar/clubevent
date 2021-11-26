import 'package:clubevent/data/services/auth_perfil_service.dart';
import 'package:clubevent/domain/models/auth_perfil_model.dart';
import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class AuthPerfilResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const AuthPerfilResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthPerfilService service = AuthPerfilService();
    Future<List<AuthPerfil>> futureEvents = service.fecthData();
    return FutureBuilder<List<AuthPerfil>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              AuthPerfil perfil = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre: ${perfil.nombre}"),
                    Text("Descripción: ${perfil.descripcion}"),
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