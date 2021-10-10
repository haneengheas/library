import 'package:flutter/material.dart';
import 'package:library_guide/constant/styles.dart';
import 'package:library_guide/screens/registration/password_recovery.dart';
import 'package:library_guide/screens/registration/sign_in_screen.dart';
import 'package:library_guide/screens/user/navigation.dart';
import 'package:library_guide/widgets/button/flatbuton.dart';
import 'package:library_guide/widgets/button/textbuton.dart';
import 'package:library_guide/widgets/input_field_regeist.dart';
import 'package:library_guide/widgets/logo.dart';

class LogInScreen extends StatefulWidget {
  final void Function (String email, String password, BuildContext context, bool islogin) submitAuthForm;

  LogInScreen(this.submitAuthForm);


  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validateForm() {
    print('aa');
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.submitAuthForm(email,password,context,isLogin);
      print(email);
      print(password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavigationScreen()));
    } else {
      return;
    }
  }

  // final _auth = FirebaseAuth.instance;
  // bool modal_progress_hud = false;
  String email = '';
  String password = '';
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
          SizedBox(height: 35),
      Logo(
        height: 140,
      ),
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
        //d
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              InputFieldRegist(
                hint: 'ادخل البريد الالكتروني',
                label: 'البريد الالكتروني',
                scure: false,
                validator: (value) {
                  email = value;
                  if (value!.isEmpty) {
                    return 'برجاء كتابه البريد الالكتروني بشكل صحيح';
                  } else if (value.toString().contains('@')) {
                    return 'يجب ان يحتوي البريد الالكتروني علي @';
                  }
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              InputFieldRegist(
                hint: 'ادخل كلمة المرور',
                label: 'كلمة المرور',
                scure: true,
                validator: (value) {
                  password = value;
                  if (value!.isEmpty) {
                    return 'برجاء كتابه كلمة المرور بشكل صحيح';
                  } else if (value.length < 5) {
                    return 'يجب ان نكون كلمة المرور تحتوي علي الاقل من خمس ارقام';
                  }
                },
                onSaved: (value) {
                  password = value;
                },
              ),
            ],
          )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Textbuton('هل نسيت كلمة المرور', onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PasswordRecovery()));
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
      Buton("تسجيل دخول", onTap: () {}),
        ],
      ),
    );
  }
}
