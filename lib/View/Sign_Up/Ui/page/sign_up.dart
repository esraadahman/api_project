import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/actions/button.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/actions/textbottom.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/image/image.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/header/pageHeading.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/textfiled/textfiled.dart';
import 'package:project_api2/View/Sign_Up/cubit/cubit/signup_cubit.dart';
import 'package:project_api2/View/Sign_in/Ui/page/Signin.dart';
import 'package:project_api2/core/routing/router.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SignupCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.signUpFormKey,
                  child: Column(
                    children: [
                      //  PageHeader(),
                      PageHeading(title: "Sign Up"),
                      PickImageWidget(),
                      textfiled(
                        labelText: 'Name',
                        hintText: 'Your name',
                        isDense: true,
                        controller: cubit.signup_name,
                      ),
                      const SizedBox(height: 16),
                      //!Email
                      textfiled(
                        labelText: 'Email',
                        hintText: 'Your email',
                        isDense: true,
                        controller: cubit.signup_email,
                      ),

                      const SizedBox(height: 16),
                      //! Password
                      textfiled(
                        labelText: 'Password',
                        hintText: 'Your password',
                        isDense: true,
                        obscureText: true,
                        suffixIcon: true,
                        controller: cubit.signup_password,
                      ),
                      const SizedBox(height: 16),
                      //! Password
                      textfiled(
                        labelText: 'Bio',
                        hintText: 'Your Bio information',
                        isDense: true,
                        obscureText: true,
                        suffixIcon: true,
                        controller: cubit.signup_password,
                      ),

                      const SizedBox(height: 25),
                      CustomFormButton(
                        innerText: 'Sign up',
                        onPressed: () {
                          //cubit.sign_up();
                        },
                      ),
                      const SizedBox(height: 18),
                      //! Already have an account widget
                      textbottom(
                        onPressed: () {
                          context.navigateTo(SignIn());
                        },
                        text: 'Already have an account ? ',
                        buttonname: 'Log-in',
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
