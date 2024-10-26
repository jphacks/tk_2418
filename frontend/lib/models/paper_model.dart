class PaperModel {
  final String title;
  final String status;
  final int views;

  PaperModel({
    required this.title,
    required this.status,
    required this.views,
  });

  factory PaperModel.fromJson(Map<String, dynamic> json) {
    return PaperModel(
      title: json['title'],
      status: json['status'],
      views: json['views'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'status': status,
      'views': views,
    };
  }
}
