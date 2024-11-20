import 'package:flutter/material.dart';
import 'package:pet_adoption/constants.dart';

class CustomScaffold extends StatelessWidget {
  final Widget
      body; // The body of the page (specific content of Home or Brand Page)

  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(kDummyProfilePicUrl),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: kBrownColor,
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(kDummyProfilePicUrl),
                  radius: 40,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/'); // Use pushReplacementNamed to navigate
              },
            ),
            ListTile(
              title: const Text('Brand'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/brand'); // Use pushReplacementNamed to navigate
              },
            ),
          ],
        ),
      ),
      body:
          body, // Pass the body (content) to be displayed in the body of the Scaffold
    );
  }
}
