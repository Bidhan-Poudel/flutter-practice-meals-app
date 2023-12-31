import 'package:flutter/material.dart';
import 'package:todo_app/data/dummy_data.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/meal.dart';
import 'package:todo_app/screens/meals.dart';
import 'package:todo_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

  final void Function (Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals,onToggleFavorite:onToggleFavorite ,),
      ),
    );
    // Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return
     GridView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          //availableCategoris.map((category)=> CategoryGridItem(category:Category))
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectategory: () {
                _selectCategory(context, category );
              },
            )
        ],
    );
  }
}
