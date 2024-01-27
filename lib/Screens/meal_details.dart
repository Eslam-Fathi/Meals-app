import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsSceen extends StatelessWidget {
  const MealDetailsSceen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            placeholder: MemoryImage(
              kTransparentImage,
            ),
            image: NetworkImage(
              meal.imageUrl,
            ),
          ),
        ],
      ),
    );
  }
}
