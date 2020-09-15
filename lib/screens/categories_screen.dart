import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../widgets/drawer.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apna Dhaba"),
      ),
      drawer: MyDrawer(),
      body: GridView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            ...DUMMY_CATEGORIES.map((ctxData) {
              return CategoryItem(
                  id: ctxData.id, color: ctxData.color, title: ctxData.title);
            }).toList()
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10)),
    );
  }
}
