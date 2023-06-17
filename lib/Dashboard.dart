import 'package:flutter/material.dart';
import 'package:mobapps/CekResi.dart';
import 'package:mobapps/payment.dart';
import 'package:mobapps/SignIn.dart';
import 'package:mobapps/payment.dart';
import 'package:mobapps/maps.dart';
import 'package:mobapps/Cam.dart';
import 'package:mobapps/Profile.dart';
import 'package:camera/camera.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("DashBoard"),
        backgroundColor: Color.fromARGB(255, 228, 3, 3),
      ),
      backgroundColor: Color.fromARGB(255, 241, 155, 155),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  new BoxDecoration(color: Color.fromARGB(255, 228, 3, 3)),
              accountName: new Text("Monkey D Luffy",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0)),
              accountEmail: new Text("Kaizoku-Oni@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://e7.pngegg.com/pngimages/113/90/png-clipart-one-piece-monkey-d-luffy-illustration-monkey-d-luffy-brook-vinsmoke-sanji-goku-chibi-one-piece-food-hand.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Ubah Password"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Tentang"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignInPage();
                }));
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MapSample();
                  }));
                },
                splashColor: Color.fromARGB(255, 241, 155, 155),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.add_location,
                        size: 70.0,
                        color: Color.fromARGB(255, 228, 3, 3),
                      ),
                      Text(
                        "Atur Alamat",
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
                splashColor: Color.fromARGB(255, 241, 155, 155),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.account_balance_wallet,
                        size: 70.0,
                        color: Color.fromARGB(255, 228, 3, 3),
                      ),
                      Text(
                        "Pembayaran",
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TrackingApp();
                  }));
                },
                splashColor: Color.fromARGB(255, 241, 155, 155),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.announcement_outlined,
                        size: 70.0,
                        color: Color.fromARGB(255, 228, 3, 3),
                      ),
                      Text(
                        "Cek Resi",
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CameraApp();
                  }));
                },
                splashColor: Color.fromARGB(255, 241, 155, 155),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.camera,
                        size: 70.0,
                        color: Color.fromARGB(255, 228, 3, 3),
                      ),
                      Text(
                        "Foto Paket",
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Profile();
                  }));
                },
                splashColor: Color.fromARGB(255, 241, 155, 155),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.edit_document,
                        size: 70.0,
                        color: Color.fromARGB(255, 228, 3, 3),
                      ),
                      Text(
                        "Edit Profile",
                        style: new TextStyle(fontSize: 17.0),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
