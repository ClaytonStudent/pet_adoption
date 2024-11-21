import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for Clipboard

import '../constants.dart';
import '../widgets/pet_deatils_info_card.dart';
import '../widgets/pet_grid_list.dart';

class PetDetailsScreen extends StatelessWidget {
  final PetData pet;

  const PetDetailsScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPinkishColor,
      body: CustomScrollView(
        slivers: [
          // pet image
          SliverAppBar(
            forceMaterialTransparency: true,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                pet.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            /*
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: kPrimaryColor,
                ),
                onPressed: () {},
              ),
            ],*/
          ),

          // pet details
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
                  /// indicator
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      color: kGreyTextColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),

                  /// pet details info
                  PetDetailsInfoCard(pet: pet),
                  const SizedBox(height: 32),

                  /// description
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      pet.description, //kDummyDescription,
                      style: const TextStyle(
                        color: kGreyTextColor,
                      ),
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
              'ADOPT NOW',
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

  /// Bottom sheet for contact information
  Widget _buildContactInfoSheet(BuildContext context) {
    // Contact info
    const String telId = "123-456-7890";
    const String wcId = "wxid_8nbkaxlksavc11";
    const String xhsId = "xiaohongshu_id";

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

  /// Helper method to copy text to clipboard, show SnackBar, and close modal
  void _copyToClipboardAndClose(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    Navigator.pop(context); // Close the modal
    // Use root ScaffoldMessenger to ensure the SnackBar is visible
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
