import 'package:flutter/material.dart';

import 'glass_container.dart';

class HomeScreenGlassCard extends StatelessWidget {
  const HomeScreenGlassCard({
    Key? key,
    required this.title,
    required this.definition,
    required this.value,
  }) : super(key: key);

  final String title;
  final String definition;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 30),
            ),
            Text(definition),
          ],
        ),
      ),
    );
  }
}
