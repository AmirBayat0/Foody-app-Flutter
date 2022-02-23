// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../widget/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String, bool> currentFilter;

  FiltersScreen(
    this.saveFilter,
    this.currentFilter,
  );

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    _vegan = widget.currentFilter['vegan']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    super.initState();
  }

  Widget _buidSwitchListTile(
    String titel,
    String subTitle,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(titel),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  final Map<String, bool> selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };
                  widget.saveFilter(selectedFilters);
                  final snackBar = SnackBar(
                      content: const Text('Changes saved!'),
                      action: SnackBarAction(
                        label: 'See The Meals',
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your Meal Selection.",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buidSwitchListTile("Gluten-Free",
                      "Only includ gluten-free measl", _glutenFree, (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  }),
                  _buidSwitchListTile(
                      "Vegetarian", "Only includ Vegetarian measl", _vegetarian,
                      (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                  }),
                  _buidSwitchListTile("Lactose-Free",
                      "Only includ lactose-free measl", _lactoseFree, (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  }),
                  _buidSwitchListTile(
                      "Vegan", "Only includ vegan measl", _vegan, (val) {
                    setState(() {
                      _vegan = val;
                    });
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
