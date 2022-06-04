import 'package:flutter/material.dart';
import 'package:mobile_reflect/pages/home_page.dart';
import 'package:mobile_reflect/pages/login_page.dart';
import 'package:mobile_reflect/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reflect',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryColor: Colors.tealAccent[100]!,
          canvasColor: Colors.black12,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
            bodyText1: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            bodyText2: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            subtitle2: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: "/loginPage",
      routes: {
        "/loginPage": (context) => LoginPage(),
        "/registerPage": (context) => RegisterPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
