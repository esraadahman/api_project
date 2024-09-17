import 'package:project_api2/core/api/endPointes.dart';

class HomeModel {
  final List<PostData> data;

  HomeModel({
    required this.data,
  });

  factory HomeModel.fromJson(List<dynamic> jsonData) {
    return HomeModel(
      data: jsonData.map((item) => PostData.fromJson(item)).toList(),
    );
  }
}

class PostData {
  final int id;
  final int userId;
  final String title;
  final String content;
  final String? image_path;
  final String? createdAt;
  final String? updatedAt;

  PostData({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
     this.image_path,
    this.createdAt,
    this.updatedAt,
  });

  factory PostData.fromJson(Map<String, dynamic> jsonData) {
    return PostData(
      id: jsonData[ApiKey.id],
      userId: jsonData[ApiKey.user_id],
      title: jsonData[ApiKey.title],
      content: jsonData[ApiKey.content],
      image_path: jsonData[ApiKey.image_path],
      createdAt: jsonData[ApiKey.created_at],
      updatedAt: jsonData[ApiKey.updated_at],
    );
  }
}
