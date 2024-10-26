class TalkMessage {
  final String senderId;
  final String senderName;
  final String message;
  final DateTime timestamp;

  TalkMessage({
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.timestamp,
  });

  factory TalkMessage.fromJson(Map<String, dynamic> json) {
    return TalkMessage(
      senderId: json['sender_id'],
      senderName: json['sender_name'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'sender_name': senderName,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
