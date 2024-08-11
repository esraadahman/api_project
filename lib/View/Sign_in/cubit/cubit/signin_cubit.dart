import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());



  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
