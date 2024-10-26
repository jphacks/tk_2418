import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class AuthViewModel extends ChangeNotifier {
  UserModel? _user;
  final UserRepository _userRepository = UserRepository();

  bool get isLoggedIn => _user == _user;
  UserModel? get user => _user;

  // ユーザー情報をAPIから取得（Emailを引数に追加）
  Future<void> fetchUser(String email) async {
    try {
      print("_user will be ${_userRepository.getUserData(email)}");
      _user = await _userRepository.getUserData(email);
      print("user is $_user");
      notifyListeners();
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // ログイン処理
  Future<void> login(String email) async {
    bool success = await _userRepository.login(email);
    if (success) {
      await fetchUser(email); // ログイン成功後、ユーザーデータを取得
    }
    notifyListeners();
  }

  // ログアウト処理
  void logout() {
    _user = null;
    notifyListeners();
  }
}
