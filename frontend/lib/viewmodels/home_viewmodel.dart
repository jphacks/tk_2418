import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/models/user_model.dart';
import 'package:frontend/viewmodels/auth_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  AuthViewModel authViewModel = AuthViewModel();
  HomeViewModel({required this.authViewModel});
  int _selectedIndex = 0;
  final List<String> _items = ["機械学習", "連合学習", "LiDAR", "P2P"];
  final List<bool> _selected = List.generate(10, (index) => false);

  int get selectedIndex => _selectedIndex;
  List<bool> get selected => _selected;
  List<String> get items => _items;
  UserModel? get user => authViewModel.user;
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

  // 画面遷移を処理する
  void navigateToCommunityView(BuildContext context) {
    List<String> req = [];
    for (int i = 0; i < _selected.length; i++) {
      if (_selected[i]) {
        req.add(_items[i]);
      }
    }
    if(req.isNotEmpty) {
      authViewModel.changeKeywords(req!);
    }
    Navigator.pushReplacementNamed(context, '/community');
  }
}
