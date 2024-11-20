import 'package:flutter/material.dart';
import 'package:pet_adoption/widgets/custom_scaffold.dart'; // Import the CustomScaffold widget
import 'package:carousel_slider/carousel_slider.dart';

class BrandPage extends StatefulWidget {
  const BrandPage({super.key});

  @override
  State<BrandPage> createState() => _BrandPageState();
}

final List<String> bannerImages = [
  "assets/images/ad1.png",
  "assets/images/ad2.png",
  "assets/images/ad3.png",
];
int activeIndex = 0;

class _BrandPageState extends State<BrandPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
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
        ),
      ]),
    );
  }

  Widget buildImage(String assetPath, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey[300],
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      );
}
