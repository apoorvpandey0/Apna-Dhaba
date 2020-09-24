import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This is the screen that renders the GRID of categories
    // This does not requires a Scaffold because its not controlling the entire screen now - The Tabs Screen is !
    return GridView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          ...DUMMY_CATEGORIES.map((ctxData) {
            print("In categories Screen");
            return CategoryItem(
                id: ctxData.id, color: ctxData.color, title: ctxData.title);
          }).toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10));
  }
}
