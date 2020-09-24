import '../screens/tabs_screen.dart';
import '../screens/filters_screen.dart';
import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';

class MyDrawer extends StatelessWidget {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Container lets us decide the height of the Header Box
            Container(
              height: 250,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      // Profile pic
                      CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              'https://randomuser.me/api/portraits/lego/0.jpg')),

                      // Users name
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Majnu Bhaai',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 1),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Internships and settings tab section
            ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 26,
              ),
              title: Text('Meals',
                  style: TextStyle(
                    fontSize: 22,
                  )),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(TabsScreen.routeName);
              },
              selected: false,
            ),
            ListTile(
              leading: Icon(
                Icons.filter_1,
                size: 26,
              ),
              title: Text('Filters',
                  style: TextStyle(
                    fontSize: 22,
                  )),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              },
              selected: false,
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text('Contact Us'),
              onTap: () {},
              subtitle: Text(
                'Mon-Fri,10 AM-5PM',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
