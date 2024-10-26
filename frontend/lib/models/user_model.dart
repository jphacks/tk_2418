class UserModel {
  final String id;
  final String name;
  final String affiliation;
  final String profileImageUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.affiliation,
    required this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      affiliation: json['affiliation'],
      profileImageUrl: json['profile_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'affiliation': affiliation,
      'profile_image_url': profileImageUrl,
    };
  }
}
