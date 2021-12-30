import 'package:flutter/material.dart';
import 'package:test_proj/screen_two.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('Person $index'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) {
                      return ScreenTwo(
                        name: 'Person $index',
                      );
                    },
                  ),
                );
              },
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 30,
        ),
      ),
    );
  }
}
