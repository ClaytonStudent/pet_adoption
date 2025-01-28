import 'package:flutter/material.dart';
import 'package:cat_adoption/widgets/custom_scaffold.dart'; // Import the CustomScaffold widget
import '../widgets/cat_grid_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = '在售';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          // Banner
          Container(
            height: 200,
            child: Stack(
              children: [
                // Background Image
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/catBanner.png', // Make sure to add this image to your assets
                    fit: BoxFit.cover,
                  ),
                ),
                // Darkened Overlay (optional - helps text visibility)
                Container(
                  color: Colors.black.withOpacity(0.3),
                ),
                // Text
                const Center(
                  child: Text(
                    ' ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
              height: 10), // Spazio tra il banner e la lista dei gatti

          // Category buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Bottone "在售"
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '在售';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '在售'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('在售'),
                  ),
                ),
                const SizedBox(width: 8), // Spazio tra i bottoni

                // Bottone "已售"
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '已售';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '已售'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('已售'),
                  ),
                ),
                const SizedBox(width: 8), // Spazio tra i bottoni

                // Bottone "种猫"
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '种猫';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '种猫'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('种猫'),
                  ),
                ),
              ],
            ),
          ),

          // pet list
          Expanded(
            child: CatGridList(
              cats: [
                ...CatData.cats.where((cat) => cat.category == selectedCategory)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
