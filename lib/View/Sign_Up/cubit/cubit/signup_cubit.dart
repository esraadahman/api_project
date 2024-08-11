import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());



    GlobalKey<FormState> signUpFormKey = GlobalKey();



      TextEditingController signup_email = TextEditingController();
  TextEditingController signup_password = TextEditingController();
  TextEditingController signup_name = TextEditingController();
  TextEditingController signup_phone = TextEditingController();
  TextEditingController signup_bio = TextEditingController();
}
