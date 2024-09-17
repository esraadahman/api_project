import 'package:flutter/material.dart';
import 'package:project_api2/View/profile/Ui/innerpages/Edit&&delete/Ui/pages/deletepost.dart';
import 'package:project_api2/View/profile/Ui/innerpages/Edit&&delete/Ui/pages/editpost.dart';
import 'package:project_api2/core/routing/router.dart';

import 'package:project_api2/core/theming/colors/color.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  String contant;
  String date;
  int id_for_post;

  GridItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.contant,
      required this.date,
      required this.id_for_post
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.grey[200], // Light grey background
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: colors.primary),
                  onPressed: () {
                    context.navigateTo(EditPost(
                        title: title,
                      imagepath: imageUrl,
                      contant: contant,
                      date: date,
                      id: id_for_post,
                    ));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: colors.primary),
                  onPressed: () {
                    context.navigateTo(
                      DeletePost(
                      title: title,
                      imagepath: imageUrl,
                      contant: contant,
                      date: date,
                      id: id_for_post,
                    ));
                    
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
