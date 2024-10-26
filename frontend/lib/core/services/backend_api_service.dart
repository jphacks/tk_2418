import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/talk_message_model.dart';
import '../../models/user_model.dart';
// import '../../models/talk_model.dart'; //ToDo: talkModelにメッセージを蓄えさせて，ここではTalkModelを呼び出せるようにする
import '../../models/paper_model.dart';

class ApiService {
  final String baseUrl = 'https://example.com/api';

  Future<UserModel> fetchUser(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId'));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<List<UserModel>> fetchUserData() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<bool> loginUser(String username) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to login');
    }
    return true;
  }

  // 会話全体を取得するAPI呼び出し
  Future<List<TalkMessage>> fetchTalk(String talkId) async {
    final response = await http.get(Uri.parse('$baseUrl/talks/$talkId'));
    if (response.statusCode == 200) {
      List<TalkMessage> talks = [];
      for(var res in jsonDecode(response.body)){
        talks.add(TalkMessage.fromJson(res));
      }
      return talks;
    } else {
      throw Exception('Failed to load talk');
    }
  }

  // メッセージを送信するAPI呼び出し
  Future<void> sendMessage(String talkId, TalkMessage message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/talks/$talkId/messages'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(message.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to send message');
    }
  }

  Future<List<PaperModel>> fetchPapers() async {
    final response = await http.get(Uri.parse('$baseUrl/literatures'));
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((lit) => PaperModel.fromJson(lit)).toList();
    } else {
      throw Exception('Failed to load literatures');
    }
  }
}
