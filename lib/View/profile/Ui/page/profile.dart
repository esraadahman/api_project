import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/Sign%20up/sign_upModel.dart';
import 'package:project_api2/View/Sign_in/Ui/page/Signin.dart';
import 'package:project_api2/View/profile/Ui/innerpages/userposts/Ui/page/userposts.dart';
import 'package:project_api2/View/profile/Ui/widgets2/Save_Changes_button.dart';
import 'package:project_api2/View/profile/Ui/widgets2/upload_profile_image.dart';
import 'package:project_api2/View/profile/Ui/widgets2/userdata.dart';
import 'package:project_api2/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/repositories/user_repository.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(userRepo(api: DioConsumer(dio: Dio())))..getdataChach(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetUserFailure || state is updateuserdataFailure) {
            // Handle both errors for fetching and updating user data
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state is GetUserFailure
                    ? state.errMessage
                    : (state as updateuserdataFailure).errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileCubit>(context);

          return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(
                  'Account Settings',
                  style: styling.subtitle.copyWith(fontSize: 20),
                ),
                centerTitle: true,
              ),
              body: Column(children: [
                size.height(20),
                // Profile/Posts Toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Toggle for 'My Profile'
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cubit.isProfileSelected = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'My Profile',
                            style: styling.maintitle.copyWith(
                              fontSize: 20,
                              color: cubit.isProfileSelected
                                  ? colors.primary
                                  : Colors.black,
                            ),
                          ),
                          if (cubit.isProfileSelected)
                            Container(
                              width: 140,
                              height: 3,
                              color: colors.primary,
                            ),
                        ],
                      ),
                    ),
                    size.width(40),
                    // Toggle for 'Posts'
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cubit.isProfileSelected = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Posts',
                            style: styling.maintitle.copyWith(
                              fontSize: 20,
                              color: !cubit.isProfileSelected
                                  ? colors.primary
                                  : Colors.black,
                            ),
                          ),
                          if (!cubit.isProfileSelected)
                            Container(
                              width: 120,
                              height: 3,
                              color: colors.primary,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                size.height(20),

                // If 'My Profile' is selected, handle profile states
                if (cubit.isProfileSelected)
                  state is GetUserLoading
                      ? CircularProgressIndicator()
                      : state is GetuserSuccess
                          ? 
                          // Userdata(
                          //     name: state.data[ApiKey.first_name],
                          //     email: state.data[ApiKey.email],
                          //     job: state.data[ApiKey.job_title],
                          //     last: state.data[ApiKey.last_name],
                          //   )
                          Expanded(
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
                                            label: Text(state.data[ApiKey.first_name].toString()),
                                        //    label: Text(name),
                                            filled: true,
                                            fillColor: colors.background,
                                            prefixIcon: Icon(Icons.person),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color:
                                                        colors.sub_background,
                                                    width: 0))),
                                      ),
                                    ),
                                    size.height(30),
                                    Container(
                                      width: 350,
                                      child: TextField(
                                        controller: cubit.user_email_cntroller,
                                        decoration: InputDecoration(
                                            hintText: 'Email',
                                            label: Text(state.data[ApiKey.email].toString()),
                                          //  label: Text(email),
                                            filled: true,
                                            fillColor: colors.background,
                                            prefixIcon: Icon(Icons.email),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color:
                                                        colors.sub_background,
                                                    width: 0))),
                                      ),
                                    ),
                                    size.height(30),
                                    Container(
                                      width: 350,
                                      child: TextField(
                                        controller:
                                            cubit.user_jobtitle_controller,
                                        decoration: InputDecoration(
                                            hintText: 'Job Title',
                                              label: Text(state.data[ApiKey.job_title].toString()),
                                          //  label: Text(job),
                                            filled: true,
                                            fillColor: colors.background,
                                            prefixIcon: Icon(Icons.person),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color:
                                                        colors.sub_background,
                                                    width: 0))),
                                      ),
                                    ),
                                    size.height(30),
                                    Container(
                                      width: 350,
                                      child: TextField(
                                        controller: cubit.user_last_controller,
                                        decoration: InputDecoration(
                                            hintText: 'Last name',
                                            label: Text(state.data[ApiKey.last_name].toString()),
                                          //  label: Text(last),
                                            filled: true,
                                            fillColor: colors.background,
                                            prefixIcon: Icon(Icons.person),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color:
                                                        colors.sub_background,
                                                    width: 0))),
                                      ),
                                    ),
                                    size.height(30),
                                    GestureDetector(
                                      onTap: () async {
                                        // cubit.updateUserProfile(first_name: cubit.user_name_controller.text, job_title: cubit.user_pass_controller.text);
                                        cubit.updateUserProfile(
                                          first_name:
                                              cubit.user_name_controller.text,
                                          job_title: cubit
                                              .user_jobtitle_controller.text,
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
                            )
                          : Container()
                else
                  Expanded(
                    child: UserPosts(),
                  ),
              ]));
        },
      ),
    );
  }
}
