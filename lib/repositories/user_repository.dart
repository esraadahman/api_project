import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/addpost/addpostModel.dart';
import 'package:project_api2/Model%20View/delete%20post/deletepost.dart';
import 'package:project_api2/Model%20View/editpost/editpost.dart';
import 'package:project_api2/Model%20View/home/homeModel.dart';
import 'package:project_api2/Model%20View/profile/profileModel.dart';
import 'package:project_api2/Model%20View/userposts/userpostsmodel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/api_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/errors/exceptions.dart';
import 'package:project_api2/core/functions/imagepacker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class userRepo {
  final ApiConsumer api;

  userRepo({required this.api});

  Future<Either<String, ProfileModel>> UpdateUserProfile({
    required String firstName,
    required String lastName,
    required String jobTitle,
  //  required XFile image,
  }) async {
    try {
      int id = await CacheHelper().getData(key: ApiKey.id);

      // Prepare data as x-www-form-urlencoded
      Map<String, dynamic> data = {
        ApiKey.first_name: firstName,
        ApiKey.last_name: lastName,
        ApiKey.job_title: jobTitle,
      //  ApiKey.image: await uploadImageToAPI(image),
      };

      // Convert data to x-www-form-urlencoded format
      String encodedData = data.entries.map((entry) {
        return '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}';
      }).join('&');

      final response = await api.put(
        EndPoint.updateUserInfo(id),
        data: encodedData, // Send the encoded data
      );
    CacheHelper().removeData(key: ApiKey.token);
      final user = ProfileModel.fromJson(response);
    //  CacheHelper().removeData(key: ApiKey.first_name);
    //  CacheHelper().removeData(key: ApiKey.job_title);

      CacheHelper().saveData(key: ApiKey.first_name, value: user.first_name);
      CacheHelper().saveData(key: ApiKey.job_title, value: user.job_title);
      CacheHelper().saveData(key: ApiKey.job_title, value: user.last_name);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  // Future<Either<String, ProfileModel>> UpdateUserProfile({
  //   required String firstName,
  //   required String jobTitle,
  //   String lastName = "dahman9",
  //   //  required XFile image
  // }) async {
  //   try {
  //     int id = await CacheHelper().getData(key: ApiKey.id);

  //     final response =
  //         await api.put(EndPoint.updateUserInfo(id),  data: {
  //       ApiKey.first_name: firstName,
  //       ApiKey.last_name: lastName,
  //       ApiKey.job_title: jobTitle
  //     });
  //     print("send response");
  //     final user = ProfileModel.fromJson(response);
  //     return Right(user);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.message);
  //   }
  // }

  Future<Either<String, Map<String, dynamic>>> getdataChach() async {
    print("enter function");
    try {

      



      final Map<String, dynamic> data = {};
      data[ApiKey.email] = await CacheHelper().getData(key: ApiKey.email);
      data[ApiKey.first_name] =
          await CacheHelper().getData(key: ApiKey.first_name);
      data[ApiKey.token] = await CacheHelper().getData(key: ApiKey.token);
      data[ApiKey.job_title] =
          await CacheHelper().getData(key: ApiKey.job_title);
      data[ApiKey.last_name] =
          await CacheHelper().getData(key: ApiKey.last_name);
      print(
          "email ${data[ApiKey.email]}   name ${data[ApiKey.first_name]}  last ${data[ApiKey.last_name]} bio${ApiKey.job_title}");
    
      print("end function ");
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

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
      {required String title,
      required String content,
      required XFile image}) async {
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

  Future<Either<String, UserPostModel>> getUserPosts() async {
    try {
      final response = await api.get(
        EndPoint.getUserPosts,
      );
      final Userposts = UserPostModel.fromJson(response);
      return Right(Userposts);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, deletepostModel>> deletepost(int id) async {
    try {
      final response = await api.delete(EndPoint.deletpost(id));
      final deletedpost = deletepostModel.fromJson(response);
      return Right(deletedpost);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Editpost>> Updatepost({
    required int post_id,
    required String title,
    required String content,
    //  required XFile image,
  }) async {
    try {
      // Prepare data as x-www-form-urlencoded
      Map<String, dynamic> data = {
        ApiKey.title: title,
        ApiKey.content: content,
        //  ApiKey.image: image,
      };

      // Convert data to x-www-form-urlencoded format
      String encodedData = data.entries.map((entry) {
        return '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}';
      }).join('&');

      final response = await api.put(
        EndPoint.updateUserPosts(post_id),
        data: encodedData, // Send the encoded data
      );

      final user = Editpost.fromJson(response);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
