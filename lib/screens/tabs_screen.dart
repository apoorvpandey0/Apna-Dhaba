import 'package:apna_dhaba/models/meal.dart';
import 'package:apna_dhaba/widgets/drawer.dart';

import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import 'package:flutter/material.dart';
// Point 1
// This is how we configureTbas in flutter
// We create an entire new screen and load this as the home screen

// Point 2
// This would work perfectly even as a Stateless Widget since we are not managing it manually

// Point 3
// There is a whole other way for adding a BottomNavigationBar() in flutter
// There we need to manage the state manually

class TabsScreen extends StatefulWidget {
  static const routeName = '/';

  List<Meal> _favourites;
  TabsScreen(this._favourites);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    print("TABS passed favs ${widget._favourites}");
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: Text('Apna Dhaba'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.category)),
                Tab(icon: Icon(Icons.favorite))
              ],
            ),
          ),
          body: TabBarView(children: [
            CategoriesScreen(),
            FavouritesScreen(widget._favourites)
          ]),
        ));
  }
}
