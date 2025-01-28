import 'package:flutter/material.dart';
import 'package:cat_adoption/constants.dart';

class CustomScaffold extends StatelessWidget {
  final Widget
      body; // The body of the page (specific content of Home or Brand Page)

  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jerry Weng Gattery'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(profilePicUrl),
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
                  backgroundImage: AssetImage(profilePicUrl),
                  radius: 40,
                ),
              ),
            ),
            ListTile(
              title: const Text('猫咪'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/home'); // Use pushReplacementNamed to navigate
              },
            ),
            ListTile(
              title: const Text('猫粮'),
              onTap: () {
                Navigator.pushReplacementNamed(context,
                    '/cat_food'); // Use pushReplacementNamed to navigate
              },
            ),
            ListTile(
              title: const Text('猫舍'),
              onTap: () {
                Navigator.pushReplacementNamed(context,
                    '/about_us'); // Use pushReplacementNamed to navigate
              },
            ),
          ],
        ),
      ),
      body:
          body, // Pass the body (content) to be displayed in the body of the Scaffold
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          if (value == 0)
            {
              Navigator.pushReplacementNamed(context, '/home'),
            }
          else if (value == 1)
            {
              Navigator.pushReplacementNamed(context, '/cat_food'),
            }
          else if (value == 2)
            {
              Navigator.pushReplacementNamed(context, '/about_us'),
            }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: '猫咪',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: '猫粮',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            label: '猫舍',
          ),
        ],
      ),
    );
  }
}
