import 'package:flutter/material.dart';
import 'package:frontend/viewmodels/auth_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  AuthViewModel authViewModel = AuthViewModel();
  int _selectedIndex = 0;
  final List<bool> _selected = List.generate(10, (index) => false);
  final List<String> _items = ["機械学習", "連合学習", "LiDAR", "P2P"];

  int get selectedIndex => _selectedIndex;
  List<bool> get selected => _selected;
  List<String> get items => _items;

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

  // 画面遷移を処理する
  void navigateToCommunityView(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/community');
  }
}
