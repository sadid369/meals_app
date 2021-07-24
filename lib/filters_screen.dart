import 'package:flutter/material.dart';
import 'package:meals_app/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Fiters'),
      ),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
