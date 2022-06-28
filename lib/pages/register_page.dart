import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
 * Name: RegisterPage
 * Author(s): Leeden Raquel
 * Inputs:
 *  None
 * Description: this class represents the register page widget
 * Returns:
 *  None
 */
class RegisterPage extends StatelessWidget {
  final _nameController =
  TextEditingController(); // represents the text editor for the name field
  final _usernameController =
  TextEditingController(); // represents the text editor for the username field
  final _emailController =
  TextEditingController(); // represents the text editor for the email field
  final _passwordController =
  TextEditingController(); // represents the text editor for the password field

  RegisterPage({Key? key}) : super(key: key);

  void registerUser(context) {
    var database = FirebaseFirestore.instance; // connect to database

    // create new user using email and password
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      database.collection("users").add({
        "username": _usernameController.text,
        "email": _emailController.text,
        "name": _nameController.text,
      }); // create new database entry for the user
      Navigator.pushNamed(context, "/home"); // go to home page
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double _textFieldLeftPad =
        200; // represents how far left the text fields start
    const double _textFieldRightPad =
        100; // represents how far right the text fields end
    const double _textFieldTopPad =
        250; // represents how high the text fields start

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
                  padding: const EdgeInsets.fromLTRB(_textFieldLeftPad, 0,
                      _textFieldRightPad, _textFieldTopPad),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "Name",
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
                      _textFieldLeftPad,
                      _textFieldTopPad - 113 > 0 ? 0 : 113 - _textFieldTopPad,
                      _textFieldRightPad,
                      _textFieldTopPad - 113 > 0 ? _textFieldTopPad - 113 : 0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Username",
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
                      _textFieldLeftPad,
                      _textFieldTopPad - 226 > 0 ? 0 : 226 - _textFieldTopPad,
                      _textFieldRightPad,
                      _textFieldTopPad - 226 > 0 ? _textFieldTopPad - 226 : 0),
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
                      _textFieldLeftPad,
                      _textFieldTopPad - 339 > 0 ? 0 : 339 - _textFieldTopPad,
                      _textFieldRightPad,
                      _textFieldTopPad - 339 > 0 ? _textFieldTopPad - 339 : 0),
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
                      _textFieldLeftPad,
                      _textFieldTopPad - 463 > 0 ? 0 : 463 - _textFieldTopPad,
                      _textFieldRightPad,
                      _textFieldTopPad - 463 > 0 ? _textFieldTopPad - 463 : 0),
                  child: Center(
                    child: CupertinoButton(
                      color: Colors.grey,
                      onPressed: () {
                        registerUser(context);
                      },
                      child: const Text("Sign Up"),
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
                        "Already have an account? ",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/loginPage");
                        },
                        child: Text(
                          "Sign In",
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
