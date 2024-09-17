import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/post/Ui/widgets/post_icon.dart';
import 'package:project_api2/View/post/Ui/widgets/postheader.dart';
import 'package:project_api2/View/profile/Ui/innerpages/Edit&&delete/cubit/cubit/edit_post_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/repositories/user_repository.dart';

class EditPost extends StatelessWidget {
  String imagepath;
  String title;
  String contant;
  String date;
  int id;
  EditPost(
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
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<EditPostCubit>(context);
          return Scaffold(
              appBar: AppBar(
                title: Text("Edit Post"),
                centerTitle: true,
                actions: [
                  GestureDetector(
                      onTap: () {
                        cubit.editpost(id);
                        context.navigateTo(Home());
                      },
                      child: Icon(
                        Icons.save,
                        color: colors.primary,
                        size: 40,
                      ))
                ],
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  //  padding: EdgeInsets.only(left: 10,right: 10,top: 15),
                  height: MediaQuery.sizeOf(context).height * .75,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.icons, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, bottom: 0),
                        child: PostHeader(
                          pathimage_user:
                              "${EndPoint.imagepath}${cubit.user_image}",
                          username: cubit.name,
                          date: date,
                        ),
                      ),
                      size.height(10),
                      Container(
                        width: 350,
                        child: TextField(
                          controller: cubit.EditTitleController,
                          decoration: InputDecoration(
                              hintText: title,
                              label: Text(title),
                              //Text(state.data[ApiKey.email].toString()),
                              filled: true,
                              fillColor: colors.background,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.sub_background, width: 0))),
                        ),
                      ),
                      size.height(10),
                      Container(
                        width: 350,
                        child: TextField(
                          controller: cubit.EditContentController,
                          decoration: InputDecoration(
                              hintText: contant,
                              label: Text(contant),
                              //Text(state.data[ApiKey.email].toString()),
                              filled: true,
                              fillColor: colors.background,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: colors.sub_background, width: 0))),
                        ),
                      ),
                      size.height(10),
                      Container(
                        width: 400,
                        height: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imagepath))),
                      ),

                      //size.height(5),

                      size.height(25),
                    ],
                  ),
                ),
              ]))));
        },
      ),
    );
  }
}
