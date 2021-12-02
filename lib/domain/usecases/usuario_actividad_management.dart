import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clubevent/data/repositories/firestore_database.dart';
import 'package:clubevent/domain/models/usuario_actividad.dart';

class UsuarioActividadManager {
  final _database = FirestoreDatabase();

  Future<void> sendUserActivity(UsuarioActividad userActivity) async {
    await _database.add(collectionPath: "users_activities", data: userActivity.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUsersActivitiesStream() {
    return _database.listenCollection(collectionPath: "users_activities");
  }

  Future<List<UsuarioActividad>> getUsersActivitiesOnce() async {
    final usersActivityData =
    await _database.readCollection(collectionPath: "users_activities");
    return _extractInstances(usersActivityData);
  }

  List<UsuarioActividad> extractUsersActivities(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    final usersActivityData = _database.extractDocs(snapshot);
    return _extractInstances(usersActivityData);
  }

  Future<void> removeUsersActivities(UsuarioActividad userActivity) async {
    await _database.deleteDoc(documentPath: userActivity.dbRef!);
  }

  List<UsuarioActividad> _extractInstances(List<Map<String, dynamic>> data) {
    List<UsuarioActividad> users_activities = [];
    for (var statusJson in data) {
      users_activities.add(UsuarioActividad.fromJson(statusJson));
    }
    return users_activities;
  }
}