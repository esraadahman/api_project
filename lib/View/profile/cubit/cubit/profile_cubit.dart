import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/profile/profileModel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/repositories/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userrepo) : super(ProfileInitial());

  final userRepo userrepo;
  TextEditingController user_name_controller = TextEditingController();
  TextEditingController user_email_cntroller = TextEditingController();
  TextEditingController user_jobtitle_controller = TextEditingController();
  TextEditingController user_last_controller = TextEditingController();
  XFile? profilePic;

  getdataChach() async {
    emit(GetUserLoading());
    final data = await userrepo.getdataChach();
    data.fold((errormessage) {
      emit(GetUserFailure(errMessage: errormessage));
    }, (data) {
      emit(GetuserSuccess(data: data));
    });
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    print("image picked ${profilePic!.path}");
    emit(UploadProfilePic());
  }

  updateUserProfile(
      {required String first_name,
      required String job_title,
      required String last_name,
      //required XFile image
      }) async {
    emit(updateuserdataLoading());
    print("enter cubit");
  //  print("first $first_name  last $last_name  job $job_title image ${image.path.toString()} ");
  
    final response = await userrepo.UpdateUserProfile(
      firstName: first_name,
      jobTitle: job_title,
  //    image: profilePic!,
      lastName: last_name,
    );
      
    response.fold((errormessage) {
      print("error happen");
      emit(updateuserdataFailure(errMessage: errormessage));
    }, (data) {
      //  CacheHelper().saveData(key: ApiKey.image, value: data.image);
      //  getdataChach();
      emit(updateuserdataSuccess(data: data));
    });
  }

  bool isProfileSelected = true;
}
