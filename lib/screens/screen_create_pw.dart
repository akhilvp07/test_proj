import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_proj/screens/screen_login.dart';

class ScreenCreatePw extends StatelessWidget {
  ScreenCreatePw({Key? key}) : super(key: key);
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Password'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
            ),
            ElevatedButton(
              onPressed: () {
                saveDataToStorage(context);
              },
              child: Text('Save Password'),
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveDataToStorage(BuildContext context) async {
    //Shared preference
    final sharedPref = await SharedPreferences.getInstance();
    //Save value
    await sharedPref.setString('saved_value', _textController.text);
    print('Saved ' + _textController.text);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return ScreenLogin();
    }));
  }
}
