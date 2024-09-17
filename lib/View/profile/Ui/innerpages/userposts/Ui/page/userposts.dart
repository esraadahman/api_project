import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/profile/Ui/innerpages/userposts/Ui/widgets/griditems.dart';
import 'package:project_api2/View/profile/Ui/innerpages/userposts/cubit/cubit/userpost_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/repositories/user_repository.dart';

class UserPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserpostCubit(userRepo(api: DioConsumer(dio: Dio())))
        ..getaUserPosts(),
      child: BlocConsumer<UserpostCubit, UserpostState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<UserpostCubit>(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  state is GetPostsLoading
                      ? Center(
                          child: const CircularProgressIndicator(
                            color: colors.primary,
                          ),
                        )
                      : state is GetPostsSuccess
                          ? Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 items per row
                                  crossAxisSpacing:
                                      8.0, // Horizontal spacing between items
                                  mainAxisSpacing:
                                      8.0, // Vertical spacing between items
                                  childAspectRatio:
                                      0.8, // Aspect ratio of the items
                                ),
                                itemCount: state.Profile.data.length,
                                itemBuilder: (context, index) {
                                  cubit.getname_of_image(
                                      state.Profile.data[index].image_path!);
                                  return GridItem(
                                    title: state.Profile.data[index].title,
                                    imageUrl:
                                        "${EndPoint.imagepath}${cubit.filename}",
                                    contant: state.Profile.data[index].content,
                                    date: cubit.formatDateTime(
                                        state.Profile.data[index].createdAt!),
                                    id_for_post: state.Profile.data[index].id,
                                  );
                                },
                              ),
                            )
                          : Container(
                              child: const Center(
                                  child: Text("no crated blogs for this user")),
                            )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
