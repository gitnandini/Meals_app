import 'package:flutter/material.dart';
import 'package:meals/widgets/main-drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;

    super.initState();
  }

  // Widget _buildSwitchListTile(String title, String description,
  //     var currentValue, Function updateValue) {
  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, void Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      //video 24

      // it should be updateValue wo brackets
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('your filters'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ]),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                //changed title to titleLarge
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            //we are in column so cant use listview directly
            //expanded uses all the space available from container
            // to end of the screen
            Expanded(
              child: ListView(children: <Widget>[
                _buildSwitchListTile('Gluten Free',
                    'only include gluten free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose Free',
                    'only include lactose free meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'only include vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'only include vegan meals', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ]),
            ),
          ],
        ));
  }
}

// class FiltersScreen extends StatelessWidget {
//   static const routeName = '/filters';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('your filters'),
//         ),
//         drawer: MainDrawer(),
//         body: Center(
//           child: Text('filters!'),
//         ));
//   }
// }
