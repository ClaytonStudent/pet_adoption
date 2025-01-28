import 'package:flutter/material.dart';
import '../screens/cat_details.dart';
import '../utils.dart';

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
                  cat.isGenderMale ? '公猫' : '母猫',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                const Icon(
                  Icons.cake_outlined,
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
  final String birthDate;
  final String age;
  final String weight;
  final bool isGenderMale;
  final bool isNeutered;
  final String description;
  final String category;
  final String price;

  CatData(
      {required this.name,
      required this.imageUrl,
      required this.breed,
      required this.birthDate,
      required this.age,
      required this.weight,
      required this.isGenderMale,
      required this.isNeutered,
      required this.price,
      required this.description,
      required this.category});

  static var cats = [
    CatData(
      name: '咪宝',
      breed: '田园',
      category: '待出售',
      isGenderMale: false,
      isNeutered: false,
      birthDate: "2021-10-01",
      age: calculateAge("2023-10-01"),
      weight: "2.5kg",
      price: "€ 1000",
      imageUrl: 'assets/images/cat1.png',
      description:
          "一只粘人的中华田园猫，性格温顺又聪明，总是喜欢跟在人身边撒娇。咪宝最爱晒太阳和蜷在柔软的毛毯上小憩，它能让你的每一天都充满暖意和微笑。",
    ),
    CatData(
      name: '雪球',
      breed: '英短',
      category: '待出售',
      isGenderMale: true,
      isNeutered: true,
      birthDate: "2020-10-01",
      age: calculateAge("2020-10-01"),
      weight: "1.5kg",
      price: "€ 2000",
      imageUrl: 'assets/images/cat2.png',
      description:
          "这是一只雪白的英国短毛猫，像雪球一样圆滚滚。雪球的好奇心特别强，总喜欢盯着窗外的世界发呆或者轻轻拍打毛绒玩具。它是家庭中最活跃的小精灵！",
    ),
    CatData(
      name: '大橘子',
      breed: '橘猫',
      category: '种猫',
      isGenderMale: false,
      isNeutered: false,
      birthDate: "2020-10-01",
      age: calculateAge("2024-10-01"),
      weight: "1.6kg",
      price: "€ 3000",
      imageUrl: 'assets/images/cat3.png',
      description:
          "一只胖乎乎的橘猫，吃饭是它最大的乐趣。大橘子天性乐观，总是以一副“无所畏惧”的样子巡视家中每一个角落，带给你满满的安全感",
    ),
    CatData(
      name: '奶泡',
      breed: '布偶',
      category: '已出售',
      isGenderMale: false,
      isNeutered: true,
      birthDate: "2020-10-01",
      age: calculateAge("2021-10-01"),
      weight: "0.5kg",
      price: "€ 4000",
      imageUrl: 'assets/images/cat4.png',
      description:
          "奶泡是一只温柔的布偶猫，它的毛色像是被牛奶轻轻打发过一样柔顺光滑。它最喜欢被抱在怀里享受抚摸，特别适合那些需要治愈的主人。奶泡的眼睛清澈如蓝天，仿佛能看穿你的内心。",
    ),
  ];
}
