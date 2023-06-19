import 'package:flutter/material.dart';
import 'package:mobapps/Cam.dart';

class Profile extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color.fromARGB(255, 228, 3, 3),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://e7.pngegg.com/pngimages/113/90/png-clipart-one-piece-monkey-d-luffy-illustration-monkey-d-luffy-brook-vinsmoke-sanji-goku-chibi-one-piece-food-hand.png"),
                backgroundColor: Color.fromARGB(246, 5, 48, 165),
                radius: 70.0,
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              TextField(
                decoration: InputDecoration(
                    hintText: "Monkey D Luffy",
                    hintStyle: TextStyle(color: Colors.black),
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    )),
              ),
              Padding(padding: EdgeInsets.all(20.0)),
              TextField(
                decoration: InputDecoration(
                    hintText: "Kaizoku-Oni@gmail.com",
                    hintStyle: TextStyle(color: Colors.black),
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
