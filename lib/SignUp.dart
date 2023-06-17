import 'package:flutter/material.dart';
import 'package:mobapps/SignIn.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    ));

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     // end: Alignment.bottomCenter,
            //     colors: [
            //   Color(0xFFFF8C3B),
            //   Color(0xFFFF6365),
            // ])
            color: Color.fromARGB(255, 228, 3, 3)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Center(
                    child: Text(
                      "Hello, User!",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  // Text(
                  //   "Hallo Guys!",
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w100),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, 0.3),
                                blurRadius: 10,
                                offset: Offset(0, 15))
                          ]),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Username',
                              hintText: "Masukkan username",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.call),
                              labelText: 'Phone Number',
                              hintText: "Masukkan phone number",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'Email',
                              hintText: "Masukkan Email",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              labelText: 'Password',
                              hintText: "Masukkan Password",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: Text("Sign Up"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        backgroundColor: Color.fromARGB(255, 228, 3, 3),
                        fixedSize: Size(300, 50),
                        elevation: 15,
                        shadowColor: Color.fromARGB(255, 228, 3, 3),
                        textStyle: TextStyle(
                          fontFamily: "Netflix",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 0.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
                      child: const Text(
                        "Already have account? Sign In",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
