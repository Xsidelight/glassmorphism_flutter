import 'package:flutter/material.dart';
import 'package:glassmorphism_flutter/ui/widgets/glass.dart';
import 'package:glassmorphism_flutter/ui/widgets/glass_container.dart';
import 'package:lottie/lottie.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
