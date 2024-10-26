import 'talk_message_model.dart';

class TalkModel {
  final String talkId;
  final String title;
  final List<TalkMessage> messages;

  TalkModel({
    required this.talkId,
    required this.title,
    required this.messages,
  });

  factory TalkModel.fromJson(Map<String, dynamic> json) {
    return TalkModel(
      talkId: json['talk_id'],
      title: json['title'],
      messages: (json['messages'] as List)
          .map((message) => TalkMessage.fromJson(message))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'talk_id': talkId,
      'title': title,
      'messages': messages.map((message) => message.toJson()).toList(),
    };
  }
}
