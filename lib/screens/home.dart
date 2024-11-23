import 'package:flutter/material.dart';
import 'package:cat_adoption/widgets/custom_scaffold.dart'; // Import the CustomScaffold widget
import '../widgets/cat_grid_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          /// pet list
          const Expanded(
            child: CatGridList(
              cats: [...CatData.cats], // , ...PetData.cats
            ),
          ),
        ],
      ),
    );
  }
}
