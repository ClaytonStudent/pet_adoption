import 'package:flutter/material.dart';
import 'package:cat_adoption/constants.dart';
import 'package:cat_adoption/screens/home.dart';
import 'package:cat_adoption/screens/about_us.dart';
import 'package:cat_adoption/screens/cat_food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome!',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          iconTheme: IconThemeData(color: kBrownColor),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: kBrownColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: '/', // Start at the Home page
      routes: {
        '/about_us': (context) =>
            const AboutUsPage(), // Define the /brand route
        '/home': (context) => const Home(), // Define the / route
        '/cat_food': (context) => const CatFood(), // Define the / route
      },
      home: const Home(),
    );
  }
}
