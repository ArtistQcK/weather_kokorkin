import 'package:flutter/material.dart';
import 'package:weather_kokorkin/Form/second_screen.dart';
import 'package:weather_kokorkin/Form/user.dart';
import 'package:weather_kokorkin/Form/register_form_page.dart';
// as http
import 'package:http/http.dart' as http;

void main() {
  runApp(const WeatherMainScreen());
}

class WeatherMainScreen extends StatelessWidget {
  const WeatherMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return MaterialPageRoute(
              builder: (context) => SecondScreen(user: settings.arguments as User,
              ),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const RegisterFormPage(),
            );
        }
      },
      home: const RegisterFormPage(),
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


Future<http.Response>  getData() async {
  const url = 'https://about.google/static/data/locations.json';
  return  await http.get(Uri.parse(url));
}