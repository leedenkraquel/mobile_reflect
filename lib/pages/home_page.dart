import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Center(
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
                        "Username",
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: columnVertMargin,
                      ),
                      TextField(
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
                      SizedBox(
                        height: columnVertMargin,
                      ),
                      TextField(
                        decoration: InputDecoration(
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
                        "Email",
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: columnVertMargin,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Favorite Food",
                          hintText: "Favorite Food",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: columnVertMargin,
                      ),
                      TextField(
                        decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
      ),
    );
  }
}
