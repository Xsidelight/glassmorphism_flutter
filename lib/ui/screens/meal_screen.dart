import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/data/categories_list.dart';
import 'package:glassmorphism_flutter/data/meal_list.dart';
import 'package:glassmorphism_flutter/ui/widgets/categories_button.dart';
import 'package:glassmorphism_flutter/ui/widgets/meal_screen_list_item.dart';
import 'package:glassmorphism_flutter/ui/widgets/glass_container.dart';
import 'package:lottie/lottie.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlassContainer(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Lottie.asset('assets/lottie_animations/86034-fire-flame.json',
                      height: 200),
                  const Text(
                    'Calories',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Which type of food?',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: categoriesList
                  .map(
                    (e) => CategoriesButton(label: e),
                  )
                  .toList(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: mealList
                  .map(
                    (e) => MealScreenListItem(
                      title: e.title,
                      description: e.description,
                      imageUrl: e.imageUrl,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
