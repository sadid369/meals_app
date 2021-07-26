import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/meal_detail_screen.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time'),
      ),
    );
  }
}
