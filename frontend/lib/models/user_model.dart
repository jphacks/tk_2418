class UserModel {
  final String id;
  final String name;
  final String email;
  List<String> keywords = [];

  UserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  void addKeyword(String keyword) {
    keywords.add(keyword);
  }
}
