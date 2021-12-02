import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubevent/data/repositories/firestore_database.dart';
import 'package:clubevent/domain/models/evento_suscripcion.dart';

class EventoSuscripcionManager {
  final _database = FirestoreDatabase();

  Future<void> sendEvent(EventoSuscripcion event) async {
    await _database.add(collectionPath: "events_suscriptions", data: event.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsStream() {
    return _database.listenCollection(collectionPath: "events_suscriptions");
  }

  Future<List<EventoSuscripcion>> getEventsOnce() async {
    final eventsData =
    await _database.readCollection(collectionPath: "events_suscriptions");
    return _extractInstances(eventsData);
  }

  List<EventoSuscripcion> extractEvents(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    final eventsData = _database.extractDocs(snapshot);
    return _extractInstances(eventsData);
  }

  Future<void> removeEvent(EventoSuscripcion event) async {
    await _database.deleteDoc(documentPath: event.dbRef!);
  }

  List<EventoSuscripcion> _extractInstances(List<Map<String, dynamic>> data) {
    List<EventoSuscripcion> statuses = [];
    for (var statusJson in data) {
      statuses.add(EventoSuscripcion.fromJson(statusJson));
    }
    return statuses;
  }
}