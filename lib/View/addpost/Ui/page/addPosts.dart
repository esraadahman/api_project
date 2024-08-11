import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/textfiled/textfiled.dart';
import 'package:project_api2/View/addpost/Ui/widgets/contenttext.dart';
import 'package:project_api2/View/addpost/Ui/widgets/pageHead.dart';
import 'package:project_api2/View/addpost/Ui/widgets/postButton.dart';
import 'package:project_api2/View/addpost/Ui/widgets/title_post.dart';
import 'package:project_api2/View/addpost/Ui/widgets/uploadButtons.dart';
import 'package:project_api2/View/addpost/cubit/cubit/addpost_cubit.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddpostCubit(),
      child: BlocConsumer<AddpostCubit, AddpostState>(
        listener: (context, state) {
          // if(state is NotAddPost) { Colors.grey; }else { colors.primary;}
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AddpostCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PageHead(
                      title: 'Add Post',
                    ),
                    title_post(
                      hintText: 'Post title',
                      controller: cubit.title,
                    ),
                    size.height(20),
                    contentText(
                      labelText: 'Content',
                      hintText: 'Content',
                      suffixIcon: false,
                      controller: cubit.content,
                    ),
                    size.height(20),
                    GestureDetector(
                        onTap: () {
                          WoltModalSheet.show<void>(
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                WoltModalSheetPage(
                                  backgroundColor: colors.background,
                                  child: UploadButtons(
                                    onPressed_Upload: () {},
                                    onPressed_Camera: () {},
                                  ),
                                ),
                              ];
                            },
                          );
                        },
                        child: DottedBorder(
                            color: colors.primary,
                            strokeWidth: 2,
                            dashPattern: const [
                              5,
                              5,
                            ],
                            child: SizedBox(
                                height: 200,
                                width: MediaQuery.sizeOf(context).width * .88,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 70, left: 45),
                                  child: ListTile(
                                    title: Text(
                                      "add post Photo",
                                      style: styling.subtitle,
                                    ),
                                    leading: const Icon(
                                        Icons.photo_camera_back_rounded,
                                        size: 50,
                                        color: colors.primary),
                                  ),
                                )))),
                    size.height(40),
                    PostButton(
                      innerText: 'Post',
                      onPressed: () {},
                      buttoncolor: colors.primary,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
