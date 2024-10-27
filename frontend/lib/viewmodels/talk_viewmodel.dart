import 'package:flutter/material.dart';
import '../models/talk_message_model.dart';
// import '../models/talk_model.dart'; //ToDo: talkModelにメッセージを蓄えさせて，ここではTalkModelを呼び出せるようにする
import '../core/services/backend_api_service.dart';

class CommunityViewModel extends ChangeNotifier {
  late List<TalkMessage?> _currentTalk;
  final ApiService _apiService = ApiService();

  List<TalkMessage?> get currentTalk => _currentTalk;

  // 会話全体を取得
  Future<void> fetchTalk(String talkId) async {
    try {
      _currentTalk = await _apiService.fetchTalk(talkId);
      notifyListeners();
    } catch (e) {
      print('Failed to fetch talk: $e');
    }
  }

  // 新しいメッセージを送信
  Future<void> sendMessage(String talkId, TalkMessage message) async {
    try {
      await _apiService.sendMessage(talkId, message);
      _currentTalk.add(message); // 送信後にローカルにも追加
      notifyListeners();
    } catch (e) {
      print('Failed to send message: $e');
    }
  }

  void navigateToHomeView(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }
}
