import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:library_guide/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class Test extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Text('text'),
            Text('text'),
            Text('text'),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        FirebaseFirestore.instance.collection('/chat/T3tUVbDyUxDh7Pvo6ffk/messages').snapshots().listen((event) {
          print(event);
        });
      },),
    );
  }
}
