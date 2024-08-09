import 'package:flutter/material.dart';
import 'package:weather_kokorkin/Form/user.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${user.name}'),
            Text('Phone: ${user.phone}'),
            Text('Email: ${user.email}'),
            Text('Country: ${user.country}'),
            Text('Story: ${user.story}'),
            Text('Password: ${user.password}'),
          ],
        ),
      ),
    );
  }
}
