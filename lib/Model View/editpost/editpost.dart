class Editpost {
  final int id;
  final int userId;
  final String title;
  final String content;
  final String imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  Editpost({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Editpost.fromJson(Map<String, dynamic> json) {
    return Editpost(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      imagePath: json['image_path'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'content': content,
      'image_path': imagePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
