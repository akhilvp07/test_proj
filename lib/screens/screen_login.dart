import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_proj/screens/screen_create_pw.dart';
import 'package:test_proj/screens/screen_home.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              //Username
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
                controller: _userController,
              ),
              const SizedBox(
                height: 10,
              ),
              //Password
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                controller: _passwordController,
              ),
              ElevatedButton(
                onPressed: () {
                  checkLogin(context);
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    final sharedPref = await SharedPreferences.getInstance();
    //Get saved value
    final savedValue = sharedPref.getString('saved_value');

    if (savedValue != null) {
      if (_passwordController.text == savedValue) {
        print('Login Success');
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
          return ScreenHome();
        }));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return ScreenCreatePw();
        }));
        print('Login Failed');
      }
    }
  }
}
