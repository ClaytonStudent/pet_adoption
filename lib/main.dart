import 'package:flutter/material.dart';
import 'package:pet_adoption/constants.dart';
import 'package:pet_adoption/screens/home.dart';
import 'package:pet_adoption/screens/brand.dart';

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
        '/brand': (context) => const BrandPage(), // Define the /brand route
      },
      home: const Home(),
    );
  }
}
