import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../core/services/backend_api_service.dart';

class UserViewModel extends ChangeNotifier {
  UserModel? _user;
  final ApiService _apiService = ApiService();

  UserModel? get user => _user;

  Future<void> fetchUser(String userId) async {
    try {
      _user = await _apiService.fetchUser(userId);
      notifyListeners();
    } catch (e) {
      print('Failed to fetch user data: $e');
    }
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
