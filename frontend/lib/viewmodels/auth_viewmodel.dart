import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class AuthViewModel extends ChangeNotifier {
  UserModel? _user;
  final UserRepository _userRepository = UserRepository();

  bool get isLoggedIn => _user == _user;
  UserModel? get user => _user;
  bool _isRegistered = false;
  String? _errorMessage;

  bool get isRegistered => _isRegistered;
  String? get errorMessage => _errorMessage;

  // ユーザー情報をAPIから取得（Emailを引数に追加）
  Future<void> fetchUser(String id) async {
    try {
      print("_user will be ${_userRepository.getUserData(id)}");
      _user = await _userRepository.getUserData(id);
      print("user is $_user");
      notifyListeners();
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // ログイン処理
  Future<void> login(String id, String email, String name) async {
    bool success = await _userRepository.login(id, name, email);
    if (success) {
      await fetchUser(id); // ログイン成功後、ユーザーデータを取得
    }
    notifyListeners();
  }

  Future<void> signUp(String id, String name, String email) async {
    try {
      _isRegistered = await _userRepository.signUp(id, name, email);
      if(_isRegistered) {
        await fetchUser(id);
      }
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _isRegistered = false;
      _errorMessage = 'ユーザー登録に失敗しました: $e';
      notifyListeners();
    }
  }

  // ログアウト処理
  void logout() {
    _user = null;
    notifyListeners();
  }
}
