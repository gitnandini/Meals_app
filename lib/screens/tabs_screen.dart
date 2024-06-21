// import 'package:flutter/material.dart';
// import 'package:meals/screens/CategoriesScreen.dart';
// import 'package:meals/screens/favourites_screen.dart';
// import 'package:meals/widgets/main-drawer.dart';
// import '../models/meal.dart';

// class TabsScreen extends StatefulWidget {
//   final List<Meal> favoriteMeals;

//   const TabsScreen(this.favoriteMeals);

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   late List<Map<String, Object>> _pages;
//   //  = [
//   //   {'page': CategoriesScreen(), 'title': 'Categories'},
//   //   {'page': FavouritesScreen( widget.favoriteMeals), 'title': 'Your Favourite'},
//   // ];
//   // final List<Widget> _pages = [
//   //   CategoriesScreen(),
//   //   FavouritesScreen(),
//   // ];
//   int _selectedPageIndex = 0;
//   @override
//   void initState() {
//     _pages = [
//       {'page': CategoriesScreen(), 'title': 'Categories'},
//       {
//         'page': FavouritesScreen(widget.favoriteMeals),
//         'title': 'Your Favourite'
//       },
//     ]; // TODO: implement initState
//     super.initState();
//   }

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(_pages[_selectedPageIndex]['title']),
//         ),
//         drawer: MainDrawer(),
//         body: _pages[_selectedPageIndex]['page'],
//         bottomNavigationBar: BottomNavigationBar(
//             onTap: _selectPage,
//             backgroundColor: Theme.of(context).primaryColor,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Theme.of(context).highlightColor,
//             currentIndex: _selectedPageIndex,
//             type: BottomNavigationBarType.shifting,
//             // OR type: BottomNavigationBarType.fixed,
//             items: [
//               BottomNavigationBarItem(
//                 backgroundColor: Theme.of(context).primaryColor,
//                 icon: Icon(Icons.category),
//                 label: 'Categories',
//               ),
//               BottomNavigationBarItem(
//                 backgroundColor: Theme.of(context).primaryColor,
//                 icon: Icon(Icons.star),
//                 label: 'Favourites',
//               ),
//             ]));
//   }
// }

// // return DefaultTabController(
//     //   length: 2,

//     //   initialIndex: 0, //which screen to load initially deafult is 0 only
//     //   child: Scaffold(
//     //       appBar: AppBar(
//     //         title: Text('Meals'),
//     //         bottom: TabBar(tabs: <Widget>[
//     //           Tab(icon: Icon(Icons.category), text: 'Categories'),
//     //           Tab(
//     //             icon: Icon(
//     //               Icons.star,
//     //             ),
//     //             text: 'Favourites',
//     //           ),
//     //         ]),
//     //       ),
//     //       body: TabBarView(
//     //         children: <Widget>[
//     //           CategoriesScreen(),
//     //           FavouritesScreen(),
//     //         ],
//     //       )),
//     // );

import 'package:flutter/material.dart';
import 'package:meals/screens/CategoriesScreen.dart';
import 'package:meals/screens/favourites_screen.dart';
import 'package:meals/widgets/main-drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavouritesScreen(widget.favoriteMeals),
        'title': 'Your Favourite'
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
