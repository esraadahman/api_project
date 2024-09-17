import 'package:project_api2/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api2/core/theming/colors/color.dart';

import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/size/size.dart';

class SaveChangesButton extends StatelessWidget {


  const SaveChangesButton({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Center(
          child: Text(
            'save',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        
      ),

      //
    );
  }
}
