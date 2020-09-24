import 'package:apna_dhaba/models/meal.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  static const routeName = '/meals-detail';
  Function toggleFavs;

  MealsDetailScreen(this.toggleFavs);
  @override
  Widget build(BuildContext context) {
    final mealId =

        // ModalRoute is class provided by flutter for specifically this purpose
        ModalRoute.of(context).settings.arguments as Map;
    // print("lsndsnfsnfpsnmpfosmfposmpofm");
    // print((mealId is Map));
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId['id']);
    return Scaffold(
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(30),
            child: FloatingActionButton(
                child: Icon(
                  Icons.favorite,
                  color: true ? Colors.white : Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  toggleFavs(selectedMeal.id);
                })),
        appBar: AppBar(title: Text(selectedMeal.title)),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Image.network(selectedMeal.imageUrl),
          Container(
              height: 300,
              child: Card(
                child: Center(
                  child: Text('uogougoug'),
                ),
              )),
          Container(
              height: 300,
              child: Card(
                child: Center(
                  child: Text('uogougoug'),
                ),
              )),
        ])));
  }
}
