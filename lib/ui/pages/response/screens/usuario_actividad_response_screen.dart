import 'package:clubevent/data/services/usuario_actividad_service.dart';
import 'package:clubevent/domain/models/usuario_actividad_model.dart';
import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class UsuarioActividadResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const UsuarioActividadResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsuarioActividadService service = UsuarioActividadService();
    Future<List<UsuarioActividad>> futureEvents = service.fecthData();
    return FutureBuilder<List<UsuarioActividad>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              UsuarioActividad usuario_actividad = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evento: ${usuario_actividad.evento.nombre}"),
                    Text("Fecha Evento: ${usuario_actividad.evento.fecha_registro}"),
                    Text("Usuario: ${usuario_actividad.usuario.nombre+' '+
                                      usuario_actividad.usuario.apellido}"),
                    Text("Tipo: ${usuario_actividad.tipo}"),
                    Text("Imagen: ${usuario_actividad.imagen}"),
                    Text("Valor: ${usuario_actividad.valor}"),
                    Text("Creado en: ${usuario_actividad.fecha_registro}"),
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