import 'package:apna_dhaba/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  // Map<String, bool> currentFilters;
  Map currentFilters;
  Function setFilters;

  FiltersScreen(this.setFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  Widget build(BuildContext context) {
    print('Inside Filters Screen');
    print(widget.currentFilters);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("Adjust your preferences",
                style: Theme.of(context).textTheme.title),
          ),
          // Expanded sets the height of ListView as max available on screen otherwise ListView has Infinity as height
          Expanded(
            child: ListView(
              children: <Widget>[
                // You can also define a buildSwitchListTile Method for more modularization
                // this will also work as fine!
                SwitchListTile(
                    value: widget.currentFilters['gluten-free'],
                    title: Text('Gluten free'),
                    subtitle: Text('The meals should be gluten free'),
                    onChanged: (bool newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                        widget.currentFilters['gluten-free'] = newValue;
                      });
                    }),
                SwitchListTile(
                    value: widget.currentFilters['lactose-free'],
                    title: Text('Lactose free'),
                    subtitle: Text('The meals should be Lactose free'),
                    onChanged: (bool newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                        widget.currentFilters['lactose-free'] = newValue;
                      });
                    }),
                SwitchListTile(
                    value: widget.currentFilters['vegetarian'],
                    title: Text('Vegetarian'),
                    subtitle: Text('The meals should be Vegetarian'),
                    onChanged: (bool newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                        widget.currentFilters['vegetarian'] = newValue;
                      });
                    }),
                SwitchListTile(
                    value: widget.currentFilters['vegan'],
                    title: Text('Should be Vegan'),
                    subtitle: Text('The meals should be Vegan'),
                    onChanged: (bool newValue) {
                      setState(() {
                        _isVegan = newValue;
                        widget.currentFilters['vegan'] = newValue;
                      });
                    }),
                RaisedButton(
                    color: Colors.amber,
                    child: Text('SAVE',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 18,
                            color: Colors.white)),
                    onPressed: () {
                      // print(widget.currentFilters);

                      widget.setFilters(widget.currentFilters);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
