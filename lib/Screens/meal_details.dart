import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: GoogleFonts.aboreto().fontFamily,
                    ),
              ),
            ),

            // Ingredients List
            ...meal.ingredients.map(
              (ingredient) => Align(
                alignment: Alignment.center,
                child: Card(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ingredient,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                            fontFamily: GoogleFonts.abel().fontFamily,
                            fontSize: 14,
                          ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Steps

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: GoogleFonts.aboreto().fontFamily,
                    ),
              ),
            ),

            // Ingredients List
            ...meal.steps.map(
              (step) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        step,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                              fontFamily: GoogleFonts.abel().fontFamily,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
