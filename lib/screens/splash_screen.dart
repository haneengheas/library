import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_guide/constant/styles.dart';
import 'package:library_guide/screens/registration/log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;

  void submitAuthForm(
      String email, String password, BuildContext context, bool islogin) async {

    try {
      UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(
              email: email,
              password: password );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LogInScreen(submitAuthForm)));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: sizeFromWidth(context, 2),
          height: sizeFromHeight(context, 2),
          decoration: BoxDecoration(
              color: clear_gray,
              shape: BoxShape.circle,
              border: Border.all(color: clear_gray, width: 1.5),
              boxShadow: [BoxShadow(color: clear_gray, blurRadius: 3)]),
          child: CircleAvatar(
              backgroundColor: white,
              radius: 45,
              child: Image(
                  image: AssetImage(
                'assets/logo.png',
              ))),
        ),
      ),
    );
  }
}
