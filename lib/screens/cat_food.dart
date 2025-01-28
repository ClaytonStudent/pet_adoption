import 'package:flutter/material.dart';
import 'package:cat_adoption/widgets/custom_scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cat_adoption/screens/food_details.dart';

class CatFood extends StatefulWidget {
  const CatFood({super.key});

  @override
  State<CatFood> createState() => _CatFoodState();
}

final List<String> bannerImages = [
  "assets/images/ad1.png",
  "assets/images/ad2.png",
  "assets/images/ad3.png",
];
int activeIndex = 0;

class _CatFoodState extends State<CatFood> {
  String selectedCategory = '干粮'; // Default category is dry food

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          // Banner with Carousel Slider
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: bannerImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final bannerImage = bannerImages[index];
                    return buildImage(bannerImage, index);
                  },
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Category buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dry Food Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '干粮';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '干粮'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('干粮'),
                  ),
                ),
                const SizedBox(width: 8),

                // Wet Food Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '湿粮';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '湿粮'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('湿粮'),
                  ),
                ),
                const SizedBox(width: 8),

                // Snacks Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = '零食';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedCategory == '零食'
                          ? Colors.orange
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('零食'),
                  ),
                ),
              ],
            ),
          ),

          // Food Grid List
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: getFoodItems()
                  .where((item) => item.category == selectedCategory)
                  .length,
              itemBuilder: (context, index) {
                final foodItems = getFoodItems()
                    .where((item) => item.category == selectedCategory)
                    .toList();
                final item = foodItems[index];
                return FoodCard(foodItem: item);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Add this method for the carousel images
  Widget buildImage(String assetPath, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey[300],
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      );

  List<FoodItem> getFoodItems() {
    return [
      FoodItem(
        name: '蒸干猫粮牛肉味',
        price: '¥199',
        image: 'assets/images/蒸干猫粮牛肉味.jpg',
        category: '干粮',
      ),
      FoodItem(
        name: '蒸干猫粮鸡肉味',
        price: '¥199',
        image: 'assets/images/蒸干猫粮鸡肉味.jpg',
        category: '干粮',
      ),
      FoodItem(
        name: '蒸干猫粮鱼肉味',
        price: '¥199',
        image: 'assets/images/蒸干猫粮鱼肉味.jpg',
        category: '干粮',
      ),
      FoodItem(
        name: '猫罐头牛肉味',
        price: '¥199',
        image: 'assets/images/猫罐头牛肉味.jpg',
        category: '干粮',
      ),
      FoodItem(
        name: '猫罐头羊肉味',
        price: '¥199',
        image: 'assets/images/猫罐头羊肉味.jpg',
        category: '干粮',
      ),
      FoodItem(
        name: '猫罐头鸡肉味',
        price: '¥199',
        image: 'assets/images/猫罐头鸡肉味.jpg',
        category: '干粮',
      ),

      FoodItem(
        name: '喵星人湿粮',
        price: '¥15',
        image: 'assets/images/cat2.png',
        category: '湿粮',
      ),
      // Add more food items here
    ];
  }
}

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsScreen(food: foodItem),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(foodItem.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    foodItem.price,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String price;
  final String image;
  final String category;

  FoodItem({
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });
}
