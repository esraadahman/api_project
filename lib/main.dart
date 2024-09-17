import 'package:flutter/material.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/Sign_Up/Ui/page/sign_up.dart';
import 'package:project_api2/View/Sign_in/Ui/page/Signin.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
       CacheHelper().getData(key: ApiKey.token) ==null? SignIn():Home(),
    //  SignIn()
    //  SignUp(),
  // Home(),
    );
  }
}

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eee"),
        centerTitle: true,
      ),
    );
  }
}
