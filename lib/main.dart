import 'package:flutter/material.dart';
import 'package:meals/dummy-data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/CategoryMeals.dart';
import 'package:meals/screens/filters-screen.dart';
import 'package:meals/screens/meal-detail-screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'screens/CategoriesScreen.dart';
import 'widgets/CategoryItem.dart';
import 'package:meals/screens/filters-screen.dart';
import 'package:meals/screens/favourites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false,
    };
    List<Meal> _availableMeals = DUMMY_MEALS;

    List<Meal> _favoriteMeals = [];

    // List<Meal> _availableMeals = DUMMY_MEALS.where((meal){
    //   //...
    // }).toList();
    // ;

    //addef function() after void
    void Function() _toggleFavorite(String mealId) {
      return () {
        final existingIndex =
            _favoriteMeals.indexWhere((meal) => meal.id == mealId);

        if (existingIndex >= 0) {
          setState(() {
            _favoriteMeals.removeAt(existingIndex);
          });
        } else {
          setState(() {
            _favoriteMeals.add(
              DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
            );
          });
        }
      };
    }

    bool _isMealFavorite(String id) {
      return _favoriteMeals.any((meal) => meal.id == id);
    }

    void _setFilters(Map<String, bool> filterData) {
      setState(() {
        _filters = filterData;

        _availableMeals = DUMMY_MEALS.where((meal) {
          if (_filters['gluten']! && !meal.isGlutenFree) {
            return false;
          }

          if (_filters['lactose']! && !meal.isLactoseFree) {
            return false;
          }

          if (_filters['vegan']! && !meal.isVegan) {
            return false;
          }

          if (_filters['vegetarian']! && !meal.isVegetarian) {
            return false;
          }

          //adding true for default case

          return true;
        }).toList();
      });
    }

    return MaterialApp(
        title: 'DeliMeals',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          hintColor: Colors.amber,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        //initialRoute: '/', //if we want to set different deafult page
        //home: CategoriesScreen(),
        //named routes
        routes: {
          // slash loads the home screen
          '/': (ctx) => TabsScreen(_favoriteMeals),
          '/categories': (ctx) => CategoryMeals(_availableMeals),
          CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavorite, _isMealFavorite),
          //FiltersScreen.routeName: (ctx) => FiltersScreen(),
          FiltersScreen.routeName: (ctx) =>
              FiltersScreen(_filters, _setFilters),
        });
  }
}
