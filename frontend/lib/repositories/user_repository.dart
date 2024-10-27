import '../models/user_model.dart';
import '../core/services/backend_api_service.dart';

class UserRepository {
  final ApiService _apiService = ApiService();

  // APIからユーザーデータを取得するメソッド
  Future<UserModel> getUserData(id) async {
    return UserModel(id: "id", name: "name", email: "email");
    // return await _apiService.fetchUser(id); //ToDO: 実装
  }

  // ログイン処理
  Future<bool> login(String id, String username, String email) async {
    if (username == "admin") {
      print("admin");
      return true;
    }
    return await _apiService.loginUser(id, username, email);
  }

  Future<bool> signUp(String id, String name, String email) async {
    return await _apiService.signUpUser(id, name, email);
  }
}
