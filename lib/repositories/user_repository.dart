import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/addpost/addpostModel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/api_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/errors/exceptions.dart';
import 'package:project_api2/core/functions/imagepacker.dart';

class userRepo {
  final ApiConsumer api;

  userRepo({required this.api});

  // Future<Either<String, UserModel>> getUserProfile() async {
  //   try {
  //     final response = await api.get(
  //       EndPoint.getuserDataEndPoint(
  //         CacheHelper().getData(key: ApiKey.id),
  //       ),
  //     );
  //     return Right(UserModel.fromJson(response));
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.message);
  //   }
  // }

  // Future<Either<String, Map<String , dynamic>>> getdataChach() async {
  //   print("enter function");
  //   try {
  //     final Map<String, dynamic> data = {};
  //     data[ApiKey.email] = await CacheHelper().getData(key: ApiKey.email);
  //     data[ApiKey.name] = await CacheHelper().getData(key: ApiKey.name);
  //     data[ApiKey.token] = await CacheHelper().getData(key: ApiKey.token);
  //     print(
  //         "email ${data[ApiKey.email]}   name ${data[ApiKey.name]}  token ${data[ApiKey.token]}");

  //     print("end function ");
  //     return Right(data);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.message);
  //   }
  // }

  Future<Either<String, HomeModel>> getallPosts() async {
    try {
      final response = await api.get(
        EndPoint.getallPosts,
      );
      final posts = HomeModel.fromJson(response);
      return Right(posts);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, AddPostModel>> addPosts(
      {required String title,required String content,required XFile image}) async {
    try {
      final response =
          await api.post(EndPoint.createPost, isFromData: true, data: {
        ApiKey.title: title,
        ApiKey.content: content,
        ApiKey.image: await uploadImageToAPI(image)
      });

      final added = AddPostModel.fromJson(response);

      return Right(added);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
