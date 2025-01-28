import 'package:cat_adoption/screens/cat_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodItem food;

  const FoodDetailsScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPinkishColor,
      body: CustomScrollView(
        slivers: [
          // Food image
          SliverAppBar(
            forceMaterialTransparency: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                food.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Food details
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Indicator
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      color: kGreyTextColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),

                  // Food details info
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              food.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              food.price,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '产品特点',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildFeaturesList(),
                        const SizedBox(height: 16),
                        const Text(
                          '适用对象',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildTargetPets(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            builder: (BuildContext context) {
              return _buildContactInfoSheet(context);
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          height: 48,
          decoration: BoxDecoration(
            gradient: kLinearGradient,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(
            child: Text(
              'BUY NOW',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesList() {
    final List<String> features = [
      '优质蛋白质，易消化吸收',
      '添加牛磺酸，保护视力和心脏',
      'omega-3和omega-6脂肪酸，亮泽毛发',
      '适量纤维，帮助肠道健康',
    ];

    return Column(
      children: features.map((feature) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: kPrimaryColor, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  feature,
                  style: const TextStyle(
                    color: kGreyTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTargetPets() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• 所有年龄段的猫咪',
          style: TextStyle(
            color: kGreyTextColor,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '• 室内外猫咪均可',
          style: TextStyle(
            color: kGreyTextColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfoSheet(BuildContext context) {
    const String telId = "0015773556477";
    const String wcId = "wxid_8nbkaxlksavc11";
    const String xhsId = "6215333448";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Contact Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.phone, color: kPrimaryColor),
            title: const Text("TEL"),
            subtitle: Text(telId),
            onTap: () {
              _copyToClipboardAndClose(context, telId);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: kPrimaryColor),
            title: const Text("WECHAT"),
            subtitle: Text(wcId),
            onTap: () {
              _copyToClipboardAndClose(context, wcId);
            },
          ),
          ListTile(
            leading: const Icon(Icons.share, color: kPrimaryColor),
            title: const Text("XIAOHONGSHU"),
            subtitle: Text(xhsId),
            onTap: () {
              _copyToClipboardAndClose(context, xhsId);
            },
          ),
        ],
      ),
    );
  }

  void _copyToClipboardAndClose(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "'$text' copied to clipboard!",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
