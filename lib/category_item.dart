import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {@required this.id, @required this.title, @required this.color});

  void selectCategory(BuildContext ctx) {
    // Method 1 using push
    // Screens are maintained as a stack
    // We are pushing our new one on top of the old one
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   // The MaterialPageRoute takes care of the sliding animations and back button and things like this
    //   return CategoryMealsScreen(id: id, title: title);
    // }));

    // Method 2 using pageNamed
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        selectCategory(context);
      },
      splashColor: Color.fromRGBO(0, 0, 0, 100),
      child: Container(
        child: Text(title, style: Theme.of(context).textTheme.title),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
