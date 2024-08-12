import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/addpost/addpostModel.dart';
import 'package:project_api2/repositories/user_repository.dart';
part 'addpost_state.dart';

class AddpostCubit extends Cubit<AddpostState> {
  AddpostCubit(this.userrepo) : super(AddpostInitial());

  final userRepo userrepo;

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  late Color buttoncolor;
  XFile? profilePic;

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  surewrite_post() {
    if (title.text.isEmpty) {
      emit(NotAddPost());
    } else {
      emit(AddPostdata());
    }
  }

  Future<void> addPosts() async {
    emit(Addpostloading());

    final data = await userrepo.addPosts(
        title: title.text, content: content.text, image: profilePic!);
    data.fold((errormessage) {
      emit(Addpostfail(errormessage: errormessage));
    }, (added) {
      emit(Addpostsuccess(data: added));
    });
  }
}
