import 'package:clubevent/data/services/evento_service.dart';
import 'package:clubevent/domain/models/evento_model.dart';
import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class EventoResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const EventoResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventoService service = EventoService();
    Future<List<Evento>> futureEvents = service.fecthData();
    return FutureBuilder<List<Evento>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              Evento evento = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre: ${evento.nombre}"),
                    Text("Fecha: ${evento.fecha}"),
                    Text("Dirección: ${evento.direccion}"),
                    Text("Estado: ${evento.estado}"),
                    Text("Creado por: ${evento.usuario_creador.nombre+' '
                                        +evento.usuario_creador.apellido}"),
                    Text("Creado en: ${evento.fecha_registro}"),
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