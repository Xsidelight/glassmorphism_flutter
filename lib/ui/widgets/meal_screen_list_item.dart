import 'package:flutter/material.dart';

import 'glass_container.dart';

class MealScreenListItem extends StatelessWidget {
  const MealScreenListItem({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  final String title;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 10,
            ),
            child: GlassContainer(
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 2),
                height: 180,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 15,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 45,
              child: Image.asset(
                imageUrl,
                scale: .6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
