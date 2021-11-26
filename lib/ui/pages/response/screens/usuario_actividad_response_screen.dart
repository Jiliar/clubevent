import 'package:clubevent/data/services/usuario_actividad_service.dart';
import 'package:clubevent/domain/models/usuario_actividad_model.dart';
import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:flutter/material.dart';


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
              UsuarioActividad usuarioActividad = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Evento: ${usuarioActividad.evento.nombre}"),
                    Text("Fecha Evento: ${usuarioActividad.evento.fechaRegistro}"),
                    Text("Usuario: ${usuarioActividad.usuario.nombre+' '+
                                      usuarioActividad.usuario.apellido}"),
                    Text("Tipo: ${usuarioActividad.tipo}"),
                    Text("Imagen: ${usuarioActividad.imagen}"),
                    Text("Valor: ${usuarioActividad.valor}"),
                    Text("Creado en: ${usuarioActividad.fechaRegistro}"),
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