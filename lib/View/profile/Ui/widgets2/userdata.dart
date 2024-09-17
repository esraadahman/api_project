import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/Sign_in/Ui/page/Signin.dart';
import 'package:project_api2/View/profile/Ui/page/profile.dart';
import 'package:project_api2/View/profile/Ui/widgets2/Save_Changes_button.dart';
import 'package:project_api2/View/profile/Ui/widgets2/upload_profile_image.dart';
import 'package:project_api2/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:project_api2/repositories/user_repository.dart';

class Userdata extends StatelessWidget {
  String name;
  String email;
  String job;
  String last;

  Userdata(
      {super.key,
      required this.name,
      required this.email,
      required this.job,
      required this.last});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<ProfileCubit>(context);
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                size.height(20),
                Row(
                  children: [
                    size.width(30),
                    size.width(25),
                    PickProfileImageWidget(),
                  ],
                ),
                size.height(50),
                Container(
                  width: 350,
                  child: TextField(
                    controller: cubit.user_name_controller,
                    decoration: InputDecoration(
                        hintText: 'User Name',
                        //label: Text(state.data[ApiKey.name].toString()),
                        label: Text(name),
                        filled: true,
                        fillColor: colors.background,
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: colors.sub_background, width: 0))),
                  ),
                ),
                size.height(30),
                Container(
                  width: 350,
                  child: TextField(
                    controller: cubit.user_email_cntroller,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        //label: Text(state.data[ApiKey.email].toString()),
                        label: Text(email),
                        filled: true,
                        fillColor: colors.background,
                        prefixIcon: Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: colors.sub_background, width: 0))),
                  ),
                ),
                size.height(30),
                Container(
                  width: 350,
                  child: TextField(
                    controller: cubit.user_jobtitle_controller,
                    decoration: InputDecoration(
                        hintText: 'Job Title',
                        //  label: Text(state.data[ApiKey.name].toString()),
                        label: Text(job),
                        filled: true,
                        fillColor: colors.background,
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: colors.sub_background, width: 0))),
                  ),
                ),
                size.height(30),
                Container(
                  width: 350,
                  child: TextField(
                    controller: cubit.user_last_controller,
                    decoration: InputDecoration(
                        hintText: 'Last name',
                        //  label: Text(state.data[ApiKey.name].toString()),
                        label: Text(last),
                        filled: true,
                        fillColor: colors.background,
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: colors.sub_background, width: 0))),
                  ),
                ),
                size.height(30),
                GestureDetector(
                  onTap: () async {
                    // cubit.updateUserProfile(first_name: cubit.user_name_controller.text, job_title: cubit.user_pass_controller.text);
                      cubit.updateUserProfile(
                      first_name:
                          cubit.user_name_controller.text,
                      job_title: cubit.user_jobtitle_controller.text,
                      last_name:
                          cubit.user_last_controller.text,
                    //  image: cubit.profilePic!,
                    );
                  //  print(
                      //  "first name ${cubit.user_name_controller.text}   last ${cubit.user_last_controller.text} job ${cubit.user_jobtitle_controller.text} image ${await cubit.profilePic!.path} ");
                      context.navigateTo(SignIn());
                  },
                  child: const SaveChangesButton(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
