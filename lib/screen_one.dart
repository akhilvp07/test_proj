import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Text on Screen 1'),
            ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (ctx) {
                //     return ScreenTwo();
                //   },
                // ));
                Navigator.of(context).pushNamed('screen2');
              },
              child: Text('Go to Screen 2'),
            )
          ],
        ),
      ),
    );
  }
}
