import 'package:project_api2/core/api/endPointes.dart';

class ProfileModel {
    final int id;
  final String first_name;
  final String last_name;
  final String email;
  final String email_verified_at;
  final String? createdAt;
  final String? updatedAt;
  final String? job_title;
  final String image;
  ProfileModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.email_verified_at,
    required this.image,
    this.createdAt,
    this.updatedAt,
    this.job_title,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileModel(
      id: jsonData[ApiKey.id],
      first_name: jsonData[ApiKey.first_name],
      createdAt: jsonData[ApiKey.created_at],
      updatedAt: jsonData[ApiKey.updated_at],
      last_name: jsonData[ApiKey.last_name],
      email: jsonData[ApiKey.email],
      email_verified_at: jsonData[ApiKey.email_verified_at],
      image: jsonData[ApiKey.image],
    );
  }
}

