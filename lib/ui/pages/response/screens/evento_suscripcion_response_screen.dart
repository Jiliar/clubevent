import 'package:clubevent/data/services/evento_suscripcion_service.dart';
import 'package:clubevent/domain/models/evento_suscripcion_model.dart';
import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


class EventoSuscripcionResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const EventoSuscripcionResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventoSuscripcionService service = EventoSuscripcionService();
    Future<List<EventoSuscripcion>> futureEvents = service.fecthData();
    return FutureBuilder<List<EventoSuscripcion>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              EventoSuscripcion evento_suscripcion = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre evento: ${evento_suscripcion.evento.nombre}"),
                    Text("Fecha evento: ${evento_suscripcion.evento.fecha}"),
                    Text("Usuario: ${evento_suscripcion.usuario.nombre
                                +' '+evento_suscripcion.usuario.apellido}"),
                    Text("Suscrito en: ${evento_suscripcion.fecha_suscripcion}"),
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