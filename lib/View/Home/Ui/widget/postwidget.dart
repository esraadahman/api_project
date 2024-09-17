import 'dart:io';
import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  String pathimage_post;
  String content;
  String pathimage_user;
  String username;
  String date;

  PostWidget(
      {super.key,
      required this.pathimage_post,
      required this.pathimage_user,
      required this.content,
      required this.username,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 339,
            height: 200,
            decoration: BoxDecoration(
              //   image: DecorationImage(
              //   image: FileImage(File(pathimage_post)),
              //   fit: BoxFit.cover, // Adjust this as needed
              // ),
              image: DecorationImage(image: NetworkImage(pathimage_post),
             fit: BoxFit.cover,
            ),)
          ),
          size.height(5),
          Text(
            content,
            style: styling.subtitle.copyWith(color: Colors.black, fontSize: 18),
          ),
          size.height(10),
          Row(
            children: [
              size.width(25),
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(pathimage_user),
              ),
              size.width(20),
              Text(username),
              size.width(25),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
