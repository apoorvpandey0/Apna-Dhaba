import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meals_detail_screen.dart';

class MealItem extends StatelessWidget {
  final id;
  final title;
  final imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final duration;
  Function toggleFavs;

  MealItem(
      {this.id,
      this.affordability,
      this.complexity,
      this.duration,
      this.imageUrl,
      this.title,
      this.toggleFavs});

  get ComplexityTextGetter {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
    }
  }

  get AffordabilityTextGetter {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
    }
  }

  void mealSelector(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealsDetailScreen.routeName, arguments: {'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealSelector(context),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: <Widget>[
            // Because we want to stack name over image
            Stack(
              children: <Widget>[
                // We are using ClipRRect to clip the Image's borders. This Fn can be used for any other Widget too!
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Positioned is used to position the title on bottom right of the image
                Positioned(
                  // the distance of child from bottom is x px
                  bottom: 20,

                  // the distance of child from right is x pixels
                  right: 0,

                  child: Container(
                    // Decoration is used to use circular borders around our black backdrop
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.black54,
                    ),

                    width: 250,
                    padding: EdgeInsets.all(5),

                    // The main title Text widget
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),

            // This is the duration and complexity Row below our image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.timer),
                  Text("$duration min"),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.work),
                  Text(ComplexityTextGetter),
                  SizedBox(
                    width: 6,
                  ),
                  Icon(Icons.attach_money),
                  Text(AffordabilityTextGetter),
                ],
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
