import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_proj/screen_create_pw.dart';
import 'package:test_proj/screen_two.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
            ),
            ElevatedButton(
              onPressed: () {
                getSaveddData(context);
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getSaveddData(BuildContext context) async {
    final sharedPref = await SharedPreferences.getInstance();
    //Get saved value
    final savedValue = sharedPref.getString('saved_value');

    if (savedValue != null) {
      if (_textController.text == savedValue) {
        print('Login Success');
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return ScreenTwo();
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
