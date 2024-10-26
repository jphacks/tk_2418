import '../models/user_model.dart';
import '../core/services/backend_api_service.dart';

class UserRepository {
  final ApiService _apiService = ApiService();

  // APIからユーザーデータを取得するメソッド
  Future<UserModel> getUserData(email) async {
    return UserModel(id: "id", name: "name", affiliation: "affiliation", profileImageUrl: "profileImageUrl");
    // return await _apiService.fetchUser(email); //ToDO: 実装
  }

  // ログイン処理
  Future<bool> login(String username) async {
    if (username == "admin") {
      print("admin");
      return true;
    }
    return await _apiService.loginUser(username);
  }
}
