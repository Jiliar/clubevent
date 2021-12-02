import 'package:clubevent/domain/models/mensaje.dart';
import 'package:clubevent/domain/models/usuario.dart';

class Chat {
  Usuario userA, userB;
  Mensaje lastMessage;
  String? reference;
  String? recordReference;

  Chat({
    required this.userA,
    required this.userB,
    required this.lastMessage,
    this.reference,
    this.recordReference,
  });

  Usuario getTargetUser(String email) {
    if (userA.email != email) {
      return userA;
    } else {
      return userB;
    }
  }

  factory Chat.fromJson(Map<String, dynamic> map) {
    final data = map['data'];
    return Chat(
      userA: Usuario.fromJson(data['userA']),
      userB: Usuario.fromJson(data['userB']),
      lastMessage: Mensaje.fromJson(data['lastMessage']),
      reference: data['reference'],
      recordReference: map['ref'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userA": userA.toJson(),
      "userB": userB.toJson(),
      "users": {
        userA.email.replaceAll('.', ''): true,
        userB.email.replaceAll('.', ''): true
      },
      "lastMessage": lastMessage.toJson(),
      "reference": reference,
    };
  }
}