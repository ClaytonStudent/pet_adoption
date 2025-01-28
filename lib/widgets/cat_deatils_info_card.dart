import 'package:flutter/material.dart';
import 'package:cat_adoption/widgets/cat_grid_list.dart';

import '../constants.dart';

class CustomInfographic extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const CustomInfographic({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 32,
          width: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: kGreyTextColor,
                fontSize: 12,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: kBrownColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CatDetailsInfoCard extends StatelessWidget {
  final CatData cat;

  const CatDetailsInfoCard({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        /// cat basic info
        Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(cat.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kBrownColor)),
                  const SizedBox(width: 8),
                  _buildSexIcon(cat.isGenderMale ? Colors.blue : Colors.pink,
                      cat.isGenderMale ? Icons.male : Icons.female),
                  const SizedBox(width: 8),
                  _buildCategoryIcon(cat.category),
                ],
              ),
              //const Spacer(),
              Text(
                cat.price,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),

        /// cat more details
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(Icons.cake_outlined),
                        ),
                        TextSpan(
                          text: "   " + cat.birthDate,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(Icons.calendar_today_outlined),
                        ),
                        TextSpan(
                          text: "   " + cat.age,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// breed
                  CustomInfographic(
                    color: kPrimaryColor,
                    title: '品种',
                    value: cat.breed,
                    //value: cat.category == "种猫" ? '是' : '否',
                  ),

                  /// Weight
                  CustomInfographic(
                    color: const Color(0xffF78F8F),
                    title: '体重',
                    value: cat.weight,
                  ),

                  /// Neutered
                  CustomInfographic(
                    color: Color(0xffF4D757),
                    title: '绝育',
                    value: cat.isNeutered ? '是' : '否',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                cat.description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Parents
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("粑粑麻麻"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(cat.imageUrl),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(cat.imageUrl),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Bro & Sis
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("同窝猫咪"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(cat.imageUrl),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(cat.imageUrl),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSexIcon(Color backgroundColor, IconData icon) {
    return Container(
      width: 20, // Set the size of the circle
      height: 20,
      decoration: BoxDecoration(
        color: backgroundColor, // Background color
        shape: BoxShape.circle, // Circular shape
      ),
      child: Center(
        child: Icon(
          icon, // Icon inside the circle
          color: Colors.white, // Icon color
          size: 20, // Icon size
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String category) {
    if (category == '种猫') {
      return Container(
        width: 20, // Circle size
        height: 20,
        decoration: BoxDecoration(
          color: Colors.lightGreen, // Background color
          shape: BoxShape.circle, // Circular shape
        ),
        child: Center(
          child: Text(
            '种', // Text inside the circle
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 16, // Font size
              fontWeight: FontWeight.bold, // Font weight
            ),
          ),
        ),
      );
    } else {
      return SizedBox.shrink(); // Empty widget if not '种猫'
    }
  }
}
