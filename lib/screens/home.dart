import 'package:flutter/material.dart';
import 'package:pet_adoption/widgets/custom_scaffold.dart'; // Import the CustomScaffold widget
import 'package:pet_adoption/widgets/pet_category_tab_bar.dart';
import '../widgets/pet_grid_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          /// category
          /*
          PetCategoryTabBar(
            categories: CategoryData.categories,
            onTabChanged: (index) {},
          ),
          const SizedBox(height: 24),
          */
          /// pet list
          const Expanded(
            child: PetGridList(
              pets: [...PetData.cats], // , ...PetData.cats
            ),
          ),
        ],
      ),
    );
  }
}
