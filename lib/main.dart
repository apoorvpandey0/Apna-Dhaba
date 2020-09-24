// A LOTTTT of work can be done on this application

import './dummy_data.dart';
import './screens/category_meals_screen.dart';
import 'models/meal.dart';
import 'package:flutter/material.dart';
import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/meals_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _favourites = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      print("Filters set to$_filters");
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten-free'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose-free'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        print("Returned True");
        return true;
      }).toList();
      print("dfindindionf");
    });
  }

  void _toggleFavourite(String selectedMeal) {
    print("I WORRRRRRRRRRKKK");
    final elementIndex = _favourites.indexWhere((meal) {
      return selectedMeal == meal.id;
    });
    if (elementIndex == -1)
      _favourites.add(DUMMY_MEALS.firstWhere((element) {
        return element.id == selectedMeal;
      }));
    else {
      _favourites.removeAt(elementIndex);
    }
  }

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

      initialRoute: '/',
      // This is the method 2 of routing screens using pageNamed
      routes: {
        // This is the homeScreen route that we can configure instead of "home:" argument
        '/': (ctx) {
          return TabsScreen(_favourites, _toggleFavourite);
        },
        '/profile': (ctx) {
          return ProfileScreen();
        },

        MealsDetailScreen.routeName: (ctx) {
          return MealsDetailScreen(_toggleFavourite);
        },
        // This is the Category Screen route usig the static const property
        CategoryMealsScreen.routeName: (ctx) {
          return CategoryMealsScreen(_availableMeals, _toggleFavourite);
        },
        FiltersScreen.routeName: (ctx) {
          return FiltersScreen(_setFilters, _filters);
        }
      },

      // Use this when you create pages on the go and some page does not exists
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return ...
      // },

      // This is 404 equivalent of the application
      // onUnknownRoute: (settings){
      //   return MaterialPageRoute(builder: (ctx){
      //     return PageNF404();
      //   })
      // },
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
