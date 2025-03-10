import 'package:flutter/material.dart';
import 'package:cat_adoption/widgets/custom_scaffold.dart'; // Import the CustomScaffold widget
import 'package:carousel_slider/carousel_slider.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

final List<String> bannerImages = [
  "assets/images/ad1.png",
  "assets/images/ad2.png",
  "assets/images/ad3.png",
];
int activeIndex = 0;

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomScrollView(slivers: <Widget>[
        // Carousel Slider
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

        // About Us Section
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shop Introduction
                const Text(
                  "关于我们",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Terry Weng Gattery",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  "位于罗马的金渐层长短毛猫舍",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),

                // Service Description
                const Text(
                  "主繁育",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // List services one by one
                const Text(
                  "- 黑金",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "- 金点",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "- 蓝金",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "- 紫金(长短毛)",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 8),
                const Text(
                  "联系方式",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                /*const Text(
                  "- Phone: 123-456-7890",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),*/
                const SizedBox(height: 8),
                const Text(
                  "- 微信: wxid_8nbkaxlksavc11",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "- 小红书: 6215333448",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "- Email: 254573166@qq.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  // Widget for displaying the image from assets
  Widget buildImage(String assetPath, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey[300],
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        ),
      );
}
