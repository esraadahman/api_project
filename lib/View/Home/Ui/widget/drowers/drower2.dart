import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_api2/View/addpost/Ui/page/addPosts.dart';
import 'package:project_api2/View/profile/Ui/page/profile.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';

class ProfileIcon extends StatelessWidget {
  final void Function()? onclick;
  String image;
  String name;
  ProfileIcon({Key? key, required this.onclick, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      child: Column(
        children: [
          size.height(30),
          CircleAvatar(
            radius: 49,
            backgroundColor: colors.primary,
            child: CircleAvatar(
              radius: 46,
              backgroundImage: NetworkImage(
                '${EndPoint.imagepath}${image}',
              ),
            ),
          ),
          const SizedBox(height: 20),
           Text(
            name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: const Icon(
                Icons.create,
                color: colors.primary,
                size: 30,
              ),
              title: Text(
                'Create Post',
                style: styling.maintitle.copyWith(fontSize: 20),
              ),
              onTap: () {
                context.navigateTo(AddPost());
              },
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: const Icon(
                Icons.person,
                color: colors.primary,
                size: 30,
              ),
              title: Text(
                'Profile',
                style: styling.maintitle.copyWith(fontSize: 20),
              ),
              onTap: () {
                context.navigateTo(ProfileScreen());
              },
            ),
          ),
          const Spacer(flex: 4),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: colors.primary,
              size: 30,
            ),
            title: Text(
              'LogOut',
              style: styling.maintitle.copyWith(fontSize: 20),
            ),
            onTap: onclick,
          ),
        ],
      ),
    );
  }
}
