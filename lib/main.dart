import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(const TestApp());

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        // home: homePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const homePage(),
          // '/facts': (context) => const factsPage(),
        });
  }
}