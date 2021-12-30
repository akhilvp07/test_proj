import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  _ScreenhomeState createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Project'),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('Person $index'),
              subtitle: Text('Message $index'),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.green,
                backgroundImage:
                    NetworkImage('https://picsum.photos/250?image=9'),
              ),
              trailing: Text('10:0$index PM'),
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
