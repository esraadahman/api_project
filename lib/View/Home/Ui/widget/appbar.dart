import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onMenuTap;
  final void Function()? onProfileTap;
  final String image;
  final AdvancedDrawerController advancedDrawerController;

  AppBarWidget({
    super.key,
    required this.onMenuTap,
    required this.advancedDrawerController,
    required this.onProfileTap, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Menu Icon Button on the left
          IconButton(
            onPressed: onMenuTap,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16), // Space between menu icon and logo
          // Logo
          const Image(
            image: AssetImage('assets/images/black_logo.png'),
            height: 40,
            width: 200,
          ),
          const Spacer(),
          // Profile Picture on the right
          GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: colors.primary,
              backgroundImage: NetworkImage("${EndPoint.imagepath}${image}"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
