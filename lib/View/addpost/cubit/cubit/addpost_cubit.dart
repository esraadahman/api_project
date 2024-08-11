import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'addpost_state.dart';

class AddpostCubit extends Cubit<AddpostState> {
  AddpostCubit() : super(AddpostInitial());

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
late  Color buttoncolor;
  XFile? profilePic;

  uploadProfilePic(XFile image) {
    profilePic = image;
    //  emit(UploadProfilePic());
  }

  surewrite_post() {
    if (title.text.isEmpty) {
      emit(NotAddPost());
    } else {
      emit(AddPostdata());
    }
  }



  
}
