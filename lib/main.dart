import 'package:flutter/material.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/Sign_Up/Ui/page/sign_up.dart';

void main() {
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
    //  SignIn()
      SignUp(),
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
