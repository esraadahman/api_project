import 'package:project_api2/core/api/endPointes.dart';

class LoginModel {
  final String token;
  final String message;
  final UserData_login user;

  LoginModel({
    required this.token,
    required this.message,
    required this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      token: jsonData[ApiKey.token],
      message: jsonData[ApiKey.message],
      user: UserData_login.fromJson(jsonData[ApiKey.user]),
    );
  }
}

class UserData_login {
  final String first_name;
  final String last_name;
  final String email;
  final String? email_verified_at;
  final String? job_title;
  final String? updatedAt;
  final String? createdAt;
  final int id;
  final String? image;

  UserData_login({
    required this.first_name,
    required this.last_name,
    required this.email,
     this.image,
    this.job_title,
    this.updatedAt,
    this.createdAt,
    required this.id,
    this.email_verified_at,
  });

  factory UserData_login.fromJson(Map<String, dynamic> jsonData) {
    return UserData_login(
      first_name: jsonData[ApiKey.first_name],
      last_name: jsonData[ApiKey.last_name],
      email: jsonData[ApiKey.email],
      job_title: jsonData[ApiKey.job_title],
      updatedAt: jsonData[ApiKey.updated_at],
      createdAt: jsonData[ApiKey.created_at],
      id: jsonData[ApiKey.id],
      image: jsonData[ApiKey.image],
      email_verified_at: jsonData[ApiKey.email_verified_at],
    );
  }
}
