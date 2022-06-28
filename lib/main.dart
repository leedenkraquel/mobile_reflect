import 'package:flutter/material.dart';
import 'package:mobile_reflect/pages/home_page.dart';
import 'package:mobile_reflect/pages/login_page.dart';
import 'package:mobile_reflect/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // initialize the firebase connection
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAOG0ZWw7q5exOo3dh0N5DGTiAOvYJ75xY",
        authDomain: "webmobilereflect.firebaseapp.com",
        projectId: "webmobilereflect",
        storageBucket: "webmobilereflect.appspot.com",
        messagingSenderId: "262140434455",
        appId: "1:262140434455:web:d8eda3a52eb7f0afe16452",
        measurementId: "G-0Q9WJ7SPR3"),
  );
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
