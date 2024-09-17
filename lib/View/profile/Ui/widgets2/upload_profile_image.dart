import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/View/addpost/Ui/widgets/addphoto.dart';
import 'package:project_api2/View/addpost/Ui/widgets/uploadButtons.dart';
import 'package:project_api2/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../repositories/user_repository.dart';

class PickProfileImageWidget extends StatelessWidget {
//  final ProfileCubit cubit;
//  void Function() onclick;

  PickProfileImageWidget({
    super.key,
    //  required this.cubit,
  //  required this.onclick
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(userRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
         final cubit = BlocProvider.of<ProfileCubit>(context);
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circle Avatar
              SizedBox(
                width: 130,
                height: 130,
                child: CircleAvatar(
                  backgroundColor: colors.primary,
                  backgroundImage: cubit.profilePic != null
                      ? FileImage(File(cubit.profilePic!.path))
                      : const AssetImage("assets/images/avatar.png")
                          as ImageProvider,
                ),
              ),
              const SizedBox(width: 20), // Space between the avatar and button

              // Styled Button to change avatar

      

              ElevatedButton(
                onPressed: () async {
                  // ImagePicker()
                  //     .pickImage(source: ImageSource.camera)
                  //     .then((value) => cubit.uploadProfilePic(value!));
                      WoltModalSheet.show<void>(
                    context: context,
                    pageListBuilder: (modalSheetContext) {
                      return [
                        WoltModalSheetPage(
                          backgroundColor: colors.background,
                          child: UploadButtons(
                            onPressed_Upload: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.gallery)
                                  .then((value) =>
                                      cubit.uploadProfilePic(value!));
                            },
                            onPressed_Camera: () {
                              ImagePicker()
                                  .pickImage(source: ImageSource.camera)
                                  .then((value) =>
                                      cubit.uploadProfilePic(value!));
                            },
                          ),
                        ),
                      ];
                    },
                  );
                },
              //  onPressed: onclick,
                style: ElevatedButton.styleFrom(
                  //  primary: Colors.transparent, // Transparent background
                  //  onPrimary: Colors.green,      // Text color
                  side: BorderSide(color: Colors.grey), // Border color
                  elevation: 0, // Remove shadow/elevation
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20), // Rounded corners (optional)
                  ),
                ),
                child: const Text("Change Avatar"),
              ),
            ],
          );
        },
      ),
    );
  }
}
