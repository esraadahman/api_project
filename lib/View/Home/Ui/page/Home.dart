import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/Home/Ui/widget/appbar.dart';
import 'package:project_api2/View/Home/Ui/widget/drowers/drower1.dart';
import 'package:project_api2/View/Home/Ui/widget/drowers/drower2.dart';
import 'package:project_api2/View/Home/Ui/widget/footer.dart';
import 'package:project_api2/View/Home/Ui/widget/green/greenSpace.dart';
import 'package:project_api2/View/Home/cubit/cubit/home_cubit.dart';
import 'package:project_api2/View/post/Ui/page/post.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/View/Home/Ui/widget/headerwidget.dart';
import 'package:project_api2/View/Home/Ui/widget/buttonSelect_team/list_view.dart';
import 'package:project_api2/View/Home/Ui/widget/postwidget.dart';
import 'package:project_api2/View/Home/Ui/widget/buttonSelect_team/selsectitems.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<HomeCubit>(context);
          return AdvancedDrawer(
            backdrop: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
                ),
              ),
            ),
            controller: cubit.advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: state is HomeMenuDrawerOpen ? false : true,
            disabledGestures: false,
            childDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            drawer: state is HomeMenuDrawerOpen ? MenuScreen() : ProfileIcon(),
            child: Scaffold(
              appBar: AppBarWidget(
                onMenuTap: cubit.openMenuDrawer,
                advancedDrawerController: cubit.advancedDrawerController,
                onProfileTap: cubit.openProfileDrawer,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderandSubscribeButtonWidget(),
                      size.height(20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cubit.list_view = !cubit.list_view;
                          });
                        },
                        child: cubit.list_view == false
                            ? SelectContainerWidget()
                            : Container(
                                margin: EdgeInsets.only(left: 45),
                                child: listView(),
                              ),
                      ),
                      size.height(20),
                      ListView.separated(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                context.navigateTo(
                                  SinglePost(
                                    pathimage_post:
                                        'assets/images/post-image.png',
                                    pathimage_user:
                                        'https://img.freepik.com/free-photo/portrait-handsome-serious-man_23-2149022618.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid',
                                    content:
                                        'This Is My First post to publish here, \n say Hi',
                                    username: 'By ,Mohamed Khaled',
                                    date: 'Sep.6,2024',
                                    title: 'post title',
                                  ),
                                );
                              },
                              child: PostWidget(
                                pathimage_post: 'assets/images/post-image.png',
                                pathimage_user:
                                    'https://img.freepik.com/free-photo/portrait-handsome-serious-man_23-2149022618.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid',
                                content:
                                    'This Is My First post to publish here, \n say Hi',
                                username: 'By ,Mohamed Khaled',
                                date: 'Sep.6,2024',
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return size.height(30);
                        },
                      ),
                      size.height(50),
                      Container(
                        width: 250,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color.fromARGB(255, 202, 200, 200),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Load More Posts',
                            style: TextStyle(
                              color: colors.primary,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      size.height(50),
                      GreenRectangleWidget(),
                      //! footer
                      Footer()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
