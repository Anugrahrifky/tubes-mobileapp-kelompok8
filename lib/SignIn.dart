import 'package:flutter/material.dart';
import 'package:mobapps/SignUp.dart';
import 'package:mobapps/Dashboard.dart';
import 'package:mobapps/Signup_controller.dart';
import 'package:mobapps/login_controller.dart';
import 'package:get/get.dart';
import 'package:mobapps/SignIn.dart';
import 'package:mobapps/Signup_controller.dart';
import 'respository/authentication_respository/authentication_repository.dart';

// void main() => runApp(const MaterialApp());
final _formkey = GlobalKey<FormState>();
final emailText = TextEditingController();
final passwordText = TextEditingController();

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    ));

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 228, 3, 3)),
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
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
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
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, 0.3),
                                blurRadius: 10,
                                offset: Offset(0, 15))
                          ]),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: controller.email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'masukkan email';
                              }
                              return null;
                            },
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
                          TextFormField(
                            controller: controller.password,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              hintText: "Masukkan Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              labelText: 'Password',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      child: Text("Sign In"),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context){
                        //   return MoodTrackerApp();
                        // }));
                        if (_formKey.currentState!.validate()) {
                          SignUpController.instance.registerUser(
                              controller.email.text.trim(),
                              controller.password.text.trim());
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyApp();
                          }));
                        }
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
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpPage();
                        }));
                      },
                      child: const Text(
                        "Don't have account? Sign Up",
                        style: TextStyle(color: Colors.grey),
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
