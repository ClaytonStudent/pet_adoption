import 'package:flutter/material.dart';
import '../screens/cat_details.dart';

/// cat Grid List
class CatGridList extends StatelessWidget {
  final List<CatData> cats;

  const CatGridList({super.key, required this.cats});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cats.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 185 / 250,
      ),
      itemBuilder: (context, index) {
        return CatGridTile(
          cat: cats[index],
        );
      },
    );
  }
}

/// cat Grid Tile
class CatGridTile extends StatelessWidget {
  final CatData cat;

  const CatGridTile({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatDetailsScreen(cat: cat),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: const LinearGradient(
            colors: [
              Colors.black12,
              Colors.black54,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: AssetImage(cat.imageUrl),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // name
            Text(
              cat.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            // breed
            Text(
              cat.breed,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // gender and age
            Row(
              children: [
                // gender icon
                Icon(
                  cat.isGenderMale ? Icons.male : Icons.female,
                  size: 16,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  cat.isGenderMale ? 'Boy' : 'Girl',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                const Icon(
                  Icons.access_time_outlined,
                  size: 16,
                  color: Colors.white,
                ),
                const SizedBox(width: 4),
                Text(
                  cat.age,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// cat Data Model
class CatData {
  final String name;
  final String imageUrl;
  final String breed;
  final String age;
  final bool isGenderMale;
  final String description;
  final String category;

  const CatData(
      {required this.name,
      required this.imageUrl,
      required this.breed,
      required this.age,
      required this.isGenderMale,
      required this.description,
      required this.category});

  static const cats = [
    CatData(
      name: 'Mia',
      breed: 'Burmilla',
      category: '待出售',
      isGenderMale: false,
      age: '2 months',
      imageUrl: 'assets/images/cat1.png',
      description:
          "A playful Burmilla kitten who loves to cuddle and explore. She's perfect for a loving family.",
    ),
    CatData(
      name: 'Oliver',
      breed: 'Australian Mist',
      category: '待出售',
      isGenderMale: true,
      age: '1 year',
      imageUrl: 'assets/images/cat2.png',
      description:
          "A friendly Australian Mist with a calm demeanor. He enjoys both playtime and quiet naps.",
    ),
    CatData(
      name: 'Jerry',
      breed: 'Scottish Fold',
      category: '种猫',
      isGenderMale: false,
      age: '2 year',
      imageUrl: 'assets/images/cat3.png',
      description:
          "A curious Scottish Fold who loves attention. She’s great with children and other cats.",
    ),
    CatData(
      name: 'Milo',
      breed: 'American Curl',
      category: '已出售',
      isGenderMale: false,
      age: '1 months',
      imageUrl: 'assets/images/cat4.png',
      description:
          "A sweet American Curl kitten full of energy. She’s ready to bring joy to her forever home.",
    ),
  ];
}
