import 'package:apna_dhaba/models/meal.dart';
import 'package:apna_dhaba/widgets/category_item.dart';
import 'package:apna_dhaba/widgets/meal_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  static const routeName = '/filters-screen';
  List<Meal> favourites = [];
  Function toggleFavs;
  FavouritesScreen(this.favourites, this.toggleFavs);
  @override
  Widget build(BuildContext context) {
    return favourites.isEmpty
        ? Center(child: Text("You dont have any favourite dishes"))
        : ListView.builder(
            itemCount: favourites.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () {
                  print("Im toggled long press");
                  // This does not works yet!

                  // toggleFavs(favourites[index].id);
                },
                child: MealItem(
                  id: favourites[index].id,
                  imageUrl: favourites[index].imageUrl,
                  affordability: favourites[index].affordability,
                  complexity: favourites[index].complexity,
                  duration: favourites[index].duration,
                  title: favourites[index].title,
                ),
              );
            },
          );
  }
}
