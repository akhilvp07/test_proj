import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_proj/screen_create_pw.dart';
import 'package:test_proj/screen_one.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getPassword(context);
    return Scaffold(
      body: Image.asset('assets/images/ambadi.png'),
    );
  }

  Future<void> getPassword(BuildContext context) async {
    final sharedPref = await SharedPreferences.getInstance();
    final password = sharedPref.getString('saved_value');

    if (password != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return ScreenOne();
      }));
    } else {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return ScreenCreatePw();
      }));

    }
  }
}
