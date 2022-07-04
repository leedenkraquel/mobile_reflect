import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*
 * Name: HomePage
 * Author(s): Leeden Raquel
 * Inputs:
 *  None
 * Description: this class represents the home page of the site
 * Returns:
 *  None
 */
class HomePage extends StatelessWidget {
  final _nameController =
      TextEditingController(); // represents the text editor for the name field
  final _colorController =
      TextEditingController(); // represents the text editor for the favorite color field
  final _foodController =
      TextEditingController(); // represents the text editor for the favorite food field
  final _coolController =
      TextEditingController(); // represents the text editor for the something cool field
  final _bioController =
      TextEditingController(); // represents the text editor for the bio field

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double pageHeight =
        400; // represents the height of the body of the home page
    const double pageWidth =
        600; // represents the width of the body of the home page
    const double columnHeight = pageHeight /
        2; // the height of the columns in the top half of the home page
    const double columnWidth = pageWidth /
        2; // the width of the columns in the top half of the home page
    const double columnVertMargin =
        10; // the height of the boxes between items in the columns in the top half of the home page

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser?.email)
            .snapshots(),
        builder: (context, snapshot) {
          try {
            var userData = snapshot.data!;
            _nameController.text =
                userData["name"]; // fills in the initial value for name
            _colorController.text = userData[
                "favorite_color"]; // fills in the initial value for favorite color
            _foodController.text = userData[
                "favorite_food"]; // fills in the initial value for favorite food
            _coolController.text = userData[
                "something_cool"]; // fills in the initial value for something cool
            _bioController.text =
                userData["bio"]; // fills in the initial value for bio

            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                height: pageHeight,
                width: pageWidth,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: columnHeight,
                        width: columnWidth,
                        padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                        child: Column(
                          children: [
                            Text(
                              userData["username"],
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: columnVertMargin,
                            ),
                            TextField(
                              controller: _nameController,
                              onEditingComplete: () {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(userData["email"])
                                    .update({
                                  "name": _nameController.text
                                }); // update the name field
                              },
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
                            const SizedBox(
                              height: columnVertMargin,
                            ),
                            TextField(
                              controller: _colorController,
                              onEditingComplete: () {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(userData["email"])
                                    .update({
                                  "favorite_color": _colorController.text
                                }); // update the favorite color field
                              },
                              decoration: const InputDecoration(
                                labelText: "Favorite Color",
                                hintText: "Favorite Color",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: columnHeight,
                        width: columnWidth,
                        padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                        child: Column(
                          children: [
                            Text(
                              userData["email"],
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: columnVertMargin,
                            ),
                            TextField(
                              controller: _foodController,
                              onEditingComplete: () {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(userData["email"])
                                    .update({
                                  "favorite_food": _foodController.text
                                }); // update the favorite food field
                              },
                              decoration: const InputDecoration(
                                labelText: "Favorite Food",
                                hintText: "Favorite Food",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: columnVertMargin,
                            ),
                            TextField(
                              controller: _coolController,
                              onEditingComplete: () {
                                FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(userData["email"])
                                    .update({
                                  "something_cool": _coolController.text
                                }); // update the something cool field
                              },
                              decoration: const InputDecoration(
                                labelText: "Something Cool",
                                hintText: "Something Cool",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: columnHeight,
                        padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                        child: TextField(
                          maxLines: null,
                          controller: _bioController,
                          onEditingComplete: () {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(userData["email"])
                                .update({
                              "bio": _bioController.text
                            }); // update the bio field
                          },
                          decoration: const InputDecoration(
                            labelText: "Bio",
                            hintText: "Bio",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } catch (e) {
            return const Center(child: Text("Loading..."));
          }
        },
      ),
    );
  }
}
