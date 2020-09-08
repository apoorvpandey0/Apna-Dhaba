import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // This property can be accessed without instantiating the class
  static const routeName = '/category-meals';

  // (Method 1) This constructor would be useful in Constructor method for routing using push
  // final String id;
  // final String title;
  // const CategoryMealsScreen({@required this.id, @required this.title});

  @override
  Widget build(BuildContext context) {
    // (Method 2) of routing between screens using pushNamed
    final routeArgs =

        // ModalRoute is class provided by flutter for specifically this purpose
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String id = routeArgs['id'];
    final String title = routeArgs['title'];

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text("YOOOOO")));
  }
}
