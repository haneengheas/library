import 'package:flutter/material.dart';
import 'package:library_guide/constant/styles.dart';
import 'package:library_guide/screens/admin/category_screen/view.dart';
import 'package:library_guide/screens/registration/sign_in_screen.dart';
import 'package:library_guide/widgets/button/flatbuton.dart';
import 'package:library_guide/widgets/button/textbuton.dart';
import 'package:library_guide/widgets/input_field.dart';
import 'package:library_guide/widgets/logo.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 35
          ),
          Logo(),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            'تسجيل الدخول',
            style: labelStyle,
          )),
          SizedBox(
            height: 20,
          ),
          InputField(
            hint: 'ادخل البريد الالكتروني',
            label: 'البريد الالكتروني',
            scure: false,
          ),
          InputField(
            hint: 'ادخل كلمة المرور',
            label: 'كلمة المرور',
            scure: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Textbuton('هل نسيت كلمة المرور', onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                })
              ],
            ),
          ),
          SizedBox(
            height: sizeFromHeight(context, 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Textbuton(
                'إنشاء حساب',
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
              SizedBox(
                height: sizeFromHeight(context, 12),
              ),
              Text(
                'ليس لديك حساب ؟',
                style: hintStyle,
              ),
            ],
          ),

          Buton("تسجيل دخول", onTap:  () {
            print ('00');
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Category()));
          })
        ],
      ),
    );
  }
}
