import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/home/homeModel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/repositories/auth_repository.dart';
import 'package:project_api2/repositories/user_repository.dart';
import 'package:path/path.dart' as path;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.userrepo, this.userrepo2) : super(HomeInitial());

  bool list_view = false;

  final advancedDrawerController = AdvancedDrawerController();

  void openMenuDrawer() {
    emit(HomeMenuDrawerOpen());
    advancedDrawerController.showDrawer();
  }

  void openProfileDrawer() {
    emit(HomeProfileDrawerOpen());
    advancedDrawerController.showDrawer();
  }

  final AuthRepo userrepo;

  Future<void> logout() async {
    emit(LogoutLoading());
    //  final token = CacheHelper().getData(key: ApiKey.token);
    final response = await userrepo.logout();
    response.fold((erromessage) {
      emit(LogoutFailure(errMessage: erromessage));
    }, (LogoutModel) {
      emit(LogoutSuccess());
    });
  }

  final userRepo userrepo2;

  Future<void> getallPosts() async {
    emit(GetPostsLoading());
    final data = await userrepo2.getallPosts();
    data.fold((errormessage) {
      emit(GetPostsFailure(errMessage: errormessage));
    }, (posts) {
      emit(GetPostsSuccess(model: posts));
    });
  }

  String filename = "";

  void getname_of_image(String fullPath) {
    //print(fullPath);
    //  String fullPath = "/storage/uploads/1723429015.jpg";
    filename = path.basename(fullPath);
    //  print(filename);
    //return filename;
    // Output: 1723429015.jpg
  }

  String user_image = "";
  String user_name = "";
  getuser_image_name() async {
    user_name = await CacheHelper().getData(key: ApiKey.first_name);
    final userimage = await CacheHelper().getData(key: ApiKey.image);
    user_image = path.basename(userimage);
  
    print("user name $user_name  user image $userimage");
  }

  String formatDateTime(String isoDate) {
    // Parse the ISO date string to a DateTime object
    DateTime dateTime = DateTime.parse(isoDate);

    // Define formats for date and time separately
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormatter = DateFormat('HH:mm:ss');

    // Format the DateTime object to strings
    String formattedDate = dateFormatter.format(dateTime);
    String formattedTime = timeFormatter.format(dateTime);

    // Return formatted date and time with newline character
    return '$formattedDate\n$formattedTime';
  }
}
