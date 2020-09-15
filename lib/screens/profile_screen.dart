import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page")),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(color: Colors.amber),
          )
        ],
      ),
    );
  }
}
