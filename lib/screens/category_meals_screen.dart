import 'package:flutter/material.dart';
import 'package:apna_dhaba/dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  // This property can be accessed without instantiating the class
  static const routeName = '/category-meals';

  // (Method 1) This constructor would be useful in Constructor method for routing using push
  // final String id;
  // final String title;
  // const CategoryMealsScreen({@required this.id, @required this.title});
  List<Meal> availableMeals;
  Function _toggleFavs;
  CategoryMealsScreen(this.availableMeals, this._toggleFavs);
  @override
  Widget build(BuildContext context) {
    // (Method 2) of routing between screens using pushNamed
    final routeArgs =

        // ModalRoute is class provided by flutter for specifically this purpose
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];

    // This selects meals for a specific category
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              // print(categoryMeals.length);
              return MealItem(
                id: categoryMeals[index].id,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,
                imageUrl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title,
                toggleFavs: _toggleFavs,
              );
            }));
  }
}
