import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/*
 * Name: LoginPage
 * Author(s): Leeden Raquel
 * Inputs:
 *  None
 * Description: this class represents the login page widget
 * Returns:
 *  None
 */
class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController(); // represents the text editor for the email field
  final _passwordController = TextEditingController(); // represents the text editor for the password field

  LoginPage({Key? key}) : super(key: key);

  void signin(context) {
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text); // sign in the user with their credentials
      if (FirebaseAuth.instance.currentUser != null) Navigator.pushNamed(context, "/home"); // go to home page
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print("No user found for that email");
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print("Wong password provided for the user");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const double textFieldLeftPad =
        200; // represents how far left the text fields start
    const double textFieldRightPad =
        100; // represents how far right the text fields end
    const double textFieldTopPad =
        150; // represents how high the text fields start

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          height: 400,
          width: 600,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Reflect",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                      textFieldLeftPad, 0, textFieldRightPad, textFieldTopPad),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                      textFieldLeftPad,
                      textFieldTopPad - 113 > 0 ? 0 : 113 - textFieldTopPad,
                      textFieldRightPad,
                      textFieldTopPad - 113 > 0 ? textFieldTopPad - 113 : 0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                      textFieldLeftPad,
                      textFieldTopPad - 250 > 0 ? 0 : 250 - textFieldTopPad,
                      textFieldRightPad,
                      textFieldTopPad - 250 > 0 ? textFieldTopPad - 250 : 0),
                  child: Center(
                    child: CupertinoButton(
                      color: Colors.grey,
                      onPressed: () {
                        signin(context);
                      },
                      child: const Text("Sign In"),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                  child: Row(
                    children: [
                      Text(
                        "Don't have an account yet? ",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/registerPage");
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.fromLTRB(50, 0, 0, 50),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("web/icons/Icon-192.png")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
