import 'package:project_api2/core/api/endPointes.dart';

class SignUpModel {
  final String token;
  final String message;
  final UserData user;

  SignUpModel({
    required this.token,
    required this.message,
    required this.user,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      token: jsonData[ApiKey.token],
      message: jsonData[ApiKey.message],
      user: UserData.fromJson(jsonData[ApiKey.user]),
    );
  }
}

class UserData {
  final String first_name;
  final String last_name;
  final String email;
  final String? job_title;
  final String? updatedAt;
  final String? createdAt;
  final int id;

  UserData(
      {required this.first_name,
      required this.last_name,
      required this.email,
      this.job_title,
      this.updatedAt,
      this.createdAt,
      required this.id});

  factory UserData.fromJson(Map<String, dynamic> jsonData) {
    return UserData(
      first_name: jsonData[ApiKey.first_name],
      last_name: jsonData[ApiKey.last_name],
      email: jsonData[ApiKey.email],
      job_title: jsonData[ApiKey.job_title],
      updatedAt: jsonData[ApiKey.updated_at],
      createdAt: jsonData[ApiKey.created_at],
      id: jsonData[ApiKey.id],
    );
  }
}
