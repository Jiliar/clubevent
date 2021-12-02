import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubevent/data/repositories/firestore_database.dart';
import 'package:clubevent/domain/models/evento.dart';

class EventoManager {
  final _database = FirestoreDatabase();

  Future<void> sendEvent(Evento event) async {
    await _database.add(collectionPath: "events", data: event.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsStream() {
    return _database.listenCollection(collectionPath: "events");
  }

  Future<List<Evento>> getEventsOnce() async {
    final eventsData =
    await _database.readCollection(collectionPath: "events");
    return _extractInstances(eventsData);
  }

  List<Evento> extractEvents(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    final eventsData = _database.extractDocs(snapshot);
    return _extractInstances(eventsData);
  }

  Future<void> removeEvent(Evento event) async {
    await _database.deleteDoc(documentPath: event.dbRef!);
  }

  List<Evento> _extractInstances(List<Map<String, dynamic>> data) {
    List<Evento> statuses = [];
    for (var statusJson in data) {
      statuses.add(Evento.fromJson(statusJson));
    }
    return statuses;
  }
}