class Mensaje {
  String sender, message;
  String? reference;
  int? timestamp;

  Mensaje(
      {required this.message,
        required this.sender,
        this.reference,
        this.timestamp});

  factory Mensaje.fromJson(Map<String, dynamic> map) {
    final data = map["data"] ?? map;
    return Mensaje(
        message: data['message'],
        sender: data['sender'],
        timestamp: data['timestamp'],
        reference: map['ref'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "sender": sender,
      "timestamp": timestamp ?? DateTime.now().millisecondsSinceEpoch,
    };
  }
}