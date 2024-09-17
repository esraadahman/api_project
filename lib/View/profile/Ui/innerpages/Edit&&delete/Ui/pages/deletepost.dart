import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/post/Ui/page/post.dart';
import 'package:project_api2/View/post/Ui/widgets/post_icon.dart';
import 'package:project_api2/View/post/Ui/widgets/postdata.dart';
import 'package:project_api2/View/post/Ui/widgets/postheader.dart';
import 'package:project_api2/View/profile/Ui/innerpages/Edit&&delete/cubit/cubit/edit_post_cubit.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/repositories/user_repository.dart';

class DeletePost extends StatelessWidget {
  String imagepath;
  String title;
  String contant;
  String date;
  int id;

  DeletePost(
      {super.key,
      required this.title,
      required this.imagepath,
      required this.contant,
      required this.date,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditPostCubit(userRepo(api: DioConsumer(dio: Dio())))..getdataChach(),
      child: BlocConsumer<EditPostCubit, EditPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<EditPostCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Delete Post"),
              centerTitle: true,
              actions: [
                GestureDetector(
                    onTap: () {
                      cubit.deletepost(id);
                      context.navigateTo(Home());
                    },
                    child: const Icon(
                      Icons.delete_rounded,
                      color: colors.primary,
                      size: 40,
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  size.height(30),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                    //  padding: EdgeInsets.only(left: 10,right: 10,top: 15),
                    height: MediaQuery.sizeOf(context).height * .7,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.icons, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 15, bottom: 0),
                          child: PostHeader(
                            pathimage_user:
                                "${EndPoint.imagepath}${cubit.user_image}",
                            username: cubit.name,
                            date: date,
                          ),
                        ),
                        size.height(5),
                        Text(title),
                        size.height(5),
                        PostData(
                          pathimage_post: imagepath,
                          content: contant,
                        ),
                        size.height(25),
                        const PostIcons(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
