import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/delete%20post/deletepost.dart';
import 'package:project_api2/Model%20View/editpost/editpost.dart';
import 'package:project_api2/Model%20View/profile/profileModel.dart';
import 'package:project_api2/View/profile/Ui/innerpages/Edit&&delete/Ui/pages/editpost.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/errors/exceptions.dart';
import 'package:project_api2/repositories/user_repository.dart';
import 'package:path/path.dart' as path;
part 'edit_post_state.dart';

class EditPostCubit extends Cubit<EditPostState> {
  EditPostCubit(this.userrepo) : super(EditPostInitial());

  TextEditingController EditTitleController = TextEditingController();
  TextEditingController EditContentController = TextEditingController();

  final userRepo userrepo;

  String name = "";
  String user_image = "";
  getdataChach() async {
  //  try {
    //  emit(getdatafordeleteloading());
      name = await CacheHelper().getData(key: ApiKey.first_name);
      //  data[ApiKey.name] = await CacheHelper().getData(key: ApiKey.name);
      final userimage = await CacheHelper().getData(key: ApiKey.image);
      user_image = path.basename(userimage);
      print(user_image);
    //  emit(getdatafordeleteSuccess());
    // } on ServerException catch (e) {
    //   emit(getdatafordeletefail());
    // }
  }
  
  deletepost(int id) async {
    final response = await userrepo.deletepost(id);
    response.fold((errromessage) {
      emit(deletepostfail(errormessage: errromessage));
    }, (data) {
      emit(deletepostSuccess(data: data));
    });
  }



  editpost(int id) async{
    final response = await userrepo.Updatepost(post_id: id, 
    title:  EditTitleController.text, content: EditContentController.text);
    response.fold((errromessage) {
      emit(editpostfail(errormessage: errromessage));
    }, (data) {
      emit(editpostSuccess(data: data));
    });
  }
}
