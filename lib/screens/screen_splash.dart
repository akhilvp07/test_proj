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
    gotoLogin();
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
    final sharedPref = await SharedPreferences.getInstance();
    final password = sharedPref.getString('saved_value');

    await Future.delayed(Duration(seconds: 1));
    //Check for saved password
    if (password != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return ScreenLogin();
      }));
    } else {
      //No saved password found
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return ScreenCreatePw();
      }));
    }
  }
}
