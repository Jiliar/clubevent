import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubevent/data/repositories/firestore_database.dart';
import 'package:clubevent/domain/models/usuario.dart';

class UsuarioManager {
  final _database = FirestoreDatabase();

  Future<void> sendEvent(Usuario usuario) async {
    await _database.add(collectionPath: "users", data: usuario.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getEventsStream() {
    return _database.listenCollection(collectionPath: "users");
  }

  Future<List<Usuario>> getEventsOnce() async {
    final usersData =
    await _database.readCollection(collectionPath: "users");
    return _extractInstances(usersData);
  }

  List<Usuario> extractEvents(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    final usersData = _database.extractDocs(snapshot);
    return _extractInstances(usersData);
  }

  Future<void> removeEvent(Usuario usuario) async {
    await _database.deleteDoc(documentPath: usuario.dbRef!);
  }

  List<Usuario> _extractInstances(List<Map<String, dynamic>> data) {
    List<Usuario> statuses = [];
    for (var statusJson in data) {
      statuses.add(Usuario.fromJson(statusJson));
    }
    return statuses;
  }
}