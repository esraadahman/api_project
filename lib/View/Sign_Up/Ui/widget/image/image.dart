import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class PickImageWidget extends StatelessWidget {
  PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CircleAvatar(
              backgroundColor: colors.primary,
              backgroundImage: const AssetImage("assets/images/avatar.png"),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: GestureDetector(
                      onTap: () async {},
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: colors.primary,
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // ImagePicker()
                            //     .pickImage(source: ImageSource.gallery)
                            //     .then(
                            //         (value) => cubit.uploadProfilePic(value!));
                          },
                          child: const Icon(
                            Icons.camera_alt_sharp,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        
    );
  }
}
