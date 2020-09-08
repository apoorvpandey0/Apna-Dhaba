import 'package:apna_dhaba/category_meals_screen.dart';
import 'package:flutter/material.dart';
import './categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Our main screen is Categories screen
      // home: CategoriesScreen(),

      // This defines the colors for entire application
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),

      // This is the method 2 of routing screens using pageNamed
      routes: {
        // This is the homeScreen route that we can configure instead of "home:" argument
        '/': (ctx) {
          CategoriesScreen();
        },

        // This is the Category Screen route usig the static const property
        CategoryMealsScreen.routeName: (ctx) {
          CategoryMealsScreen();
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("hey there!"),
        ),
      ),
    );
  }
}
