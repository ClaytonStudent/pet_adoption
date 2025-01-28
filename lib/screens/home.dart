import 'package:flutter/material.dart';
import 'package:cat_adoption/widgets/custom_scaffold.dart'; // Import the CustomScaffold widget
import '../widgets/cat_grid_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCategory = '待出售';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          // Banner
          Container(
            height: 200, // Altezza del banner
            color: Colors.orange, // Sfondo temporaneo
            child: const Center(
              child: Text(
                'Banner Temporaneo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
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
                // Bottone "待出售"
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '待出售';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '待出售'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('待出售'),
                  ),
                ),
                const SizedBox(width: 8), // Spazio tra i bottoni

                // Bottone "已出售"
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '已出售';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '已出售'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('已出售'),
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
