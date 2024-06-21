import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/categories';

  final List<Meal> availableMeals;
  CategoryMeals(this.availableMeals);

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMeals(this.categoryId, this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    //added qn marks to check null from chatgpt
    final Map<String?, String?>? routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String?, String?>?;

    if (routeArgs == null ||
        routeArgs['title'] == null ||
        routeArgs['id'] == null) {
      // Handle the case where routeArgs or specific keys are null
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Invalid or missing arguments provided for this route.'),
        ),
      );
    }

    final categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id']!;
    //not using widget.availableMeals as it is not stateful widget
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          //return Text(CategoryMeals[index].title);

          //categoryMeal and CategoryMeal are two different things which was causing an error
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
