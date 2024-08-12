import 'package:project_api2/core/api/endPointes.dart';

class AddPostModel {
  final int user_id;
  final String title;
  final String content;
  final String updated_at;
  final String created_at;
  final int id;

  AddPostModel({
    required this.user_id,
    required this.title,
    required this.content,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  factory AddPostModel.fromJson(Map<String, dynamic> jsonData) {
    return AddPostModel(
      user_id: jsonData[ApiKey.user_id],
      title: jsonData[ApiKey.title],
      content: jsonData[ApiKey.content],
      updated_at: jsonData[ApiKey.updated_at],
      created_at: jsonData[ApiKey.created_at],
      id: jsonData[ApiKey.id],
    );
  }
}
