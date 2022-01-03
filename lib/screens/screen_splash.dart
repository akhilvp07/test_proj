import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_proj/screens/screen_create_pw.dart';
import 'package:test_proj/screens/screen_login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/ambadi.png'),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenLogin();
    }));
  }

  Future<void> checkLogin() async {
    final sharedPref = await SharedPreferences.getInstance();
    final password = sharedPref.getString('saved_value');

    //Check for saved password
    if (password != null) {
      gotoLogin();
    } else {
      //No saved password found
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return ScreenCreatePw();
      }));
    }
  }
}
