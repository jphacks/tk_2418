import 'dart:math';

import 'package:flutter/material.dart';
import '../models/talk_message_model.dart';
// import '../models/talk_model.dart'; //ToDo: talkModelにメッセージを蓄えさせて，ここではTalkModelを呼び出せるようにする
import '../core/services/backend_api_service.dart';
import '../models/user_model.dart';
import 'auth_viewmodel.dart';

class CommunityViewModel extends ChangeNotifier {
  late List<TalkMessage?> _currentTalk;
  final ApiService _apiService = ApiService();
  AuthViewModel authViewModel = AuthViewModel();
  CommunityViewModel({required this.authViewModel});

  List<TalkMessage?> get currentTalk => _currentTalk;
  UserModel? get user => authViewModel.user;
  int _selectedIndex = 1;
  final List<String> _items = ["機械学習", "連合学習", "LiDAR", "P2P"];
  final List<bool> _selected = List.generate(10, (index) => false);
  int get selectedIndex => _selectedIndex;
  List<bool> get selected => _selected;
  List<String> get items => _items;
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

  // ボトムナビゲーションのインデックスを更新
  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // ボタンの選択状態をトグルする
  void toggleButton(int index) {
    _selected[index] = !_selected[index];
    notifyListeners();
  }

  void initializeSelected() {
    for (int i = 0; i < min(_items.length, _selected.length); i++) {
      if(user == null) {
        break;
      }
      if(user!.currentKeywords.contains(items[i])) {
        _selected[i] = true;
      }
    }
  }

  void navigateToHomeView(BuildContext context) {
    List<String> req = [];
    for (int i = 0; i < _selected.length; i++) {
      print("selected[$i] is ${_selected[i]}");
      if (_selected[i]) {
        req.add(_items[i]);
      }
    }
    if(req.isNotEmpty) {
      authViewModel.changeKeywords(req!);
    }
    Navigator.pushReplacementNamed(context, '/');
  }
}
