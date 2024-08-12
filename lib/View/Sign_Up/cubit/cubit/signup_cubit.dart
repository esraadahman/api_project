import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project_api2/Model%20View/Sign%20up/sign_upModel.dart';
import 'package:project_api2/repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.userrepo) : super(SignupInitial());

  final AuthRepo userrepo;

  GlobalKey<FormState> signUpFormKey = GlobalKey();

  TextEditingController signup_email = TextEditingController();
  TextEditingController signup_password = TextEditingController();
  TextEditingController signup_first_name = TextEditingController();
  TextEditingController signup_last_name = TextEditingController();
  TextEditingController signup_pass_confirm = TextEditingController();
  TextEditingController signup_job_title = TextEditingController();
  SignUpModel? user;
  sign_up() async {
    emit(SignUpLoading());
    final response = await userrepo.sign_up(
        email: signup_email.text,
        pass: signup_password.text,
        first_name: signup_first_name.text,
        last_name: signup_last_name.text,
        pass_confirm: signup_pass_confirm.text,
        job_title: signup_job_title.text);
    response.fold((errormessage) {
      emit(SignUpFailure(errMessage: errormessage));
    }, (SignUpModel) {
      emit(SignUpSuccess(message: SignUpModel.message));
    });
  }
}
