import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/Login/loginModel.dart';
import 'package:project_api2/Model%20View/Sign%20up/sign_upModel.dart';
import 'package:project_api2/Model%20View/logout/logoutModel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/api_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/errors/exceptions.dart';

class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});

  Future<Either<String, LoginModel>> sign_in(
      {required String email, required String pass}) async {
    try {
      final response = await api.post(EndPoint.signin,
          data: {ApiKey.email: email, ApiKey.password: pass}, isFromData: true);
      final user = LoginModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: user.user.id);
      CacheHelper().saveData(key: ApiKey.email, value: user.user.email);
      // CacheHelper().saveData(key: ApiKey.first_name, value: user.user.first_name);
      // CacheHelper()
      //     .saveData(key: ApiKey.last_name, value: user.user.last_name);
      CacheHelper().saveData(key: ApiKey.image, value: user.user.image);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, SignUpModel>> sign_up({
    required String email,
    required String pass,
    required String first_name,
    required String last_name,
    required String pass_confirm,
    required String job_title,
  }) async {
    try {
      final response = await api.post(EndPoint.signup, isFromData: true, data: {
        ApiKey.email: email,
        ApiKey.password: pass,
        ApiKey.first_name: first_name,
        ApiKey.last_name: last_name,
        ApiKey.password_confirmation: pass_confirm,
        ApiKey.job_title: job_title
// to send image
        //  ApiKey.image: await uploadImageToAPI(profilePic)
      });
      final user = SignUpModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: user.user.id);
      CacheHelper().saveData(key: ApiKey.email, value: user.user.email);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, LogoutModel>> logout() async {
    try {
      final response = await api.post(
        EndPoint.logout,
      );
      CacheHelper().removeData(key: ApiKey.token);
      CacheHelper().removeData(key: ApiKey.id);
      CacheHelper().removeData(key: ApiKey.email);
        CacheHelper().removeData(key: ApiKey.image);
      final response2 = LogoutModel.fromJson(response);

      return Right(response2);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
