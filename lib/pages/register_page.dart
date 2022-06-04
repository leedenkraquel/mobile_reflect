import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double textFieldLeftPad =
        200; // represents how far left the text fields start
    const double textFieldRightPad =
        100; // represents how far right the text fields end
    const double textFieldTopPad =
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
                  padding: const EdgeInsets.fromLTRB(
                      textFieldLeftPad, 0, textFieldRightPad, textFieldTopPad),
                  child: const TextField(
                    decoration: InputDecoration(
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
                      textFieldLeftPad,
                      textFieldTopPad - 113 > 0 ? 0 : 113 - textFieldTopPad,
                      textFieldRightPad,
                      textFieldTopPad - 113 > 0 ? textFieldTopPad - 113 : 0),
                  child: const TextField(
                    decoration: InputDecoration(
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
                      textFieldLeftPad,
                      textFieldTopPad - 226 > 0 ? 0 : 226 - textFieldTopPad,
                      textFieldRightPad,
                      textFieldTopPad - 226 > 0 ? textFieldTopPad - 226 : 0),
                  child: const TextField(
                    decoration: InputDecoration(
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
                      textFieldTopPad - 339 > 0 ? 0 : 339 - textFieldTopPad,
                      textFieldRightPad,
                      textFieldTopPad - 339 > 0 ? textFieldTopPad - 339 : 0),
                  child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
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
                      textFieldTopPad - 463 > 0 ? 0 : 463 - textFieldTopPad,
                      textFieldRightPad,
                      textFieldTopPad - 463 > 0 ? textFieldTopPad - 463 : 0),
                  child: Center(
                    child: CupertinoButton(
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
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
