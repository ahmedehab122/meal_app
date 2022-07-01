import 'package:flutter/material.dart';

import '../widget/main_dawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;

  FiltersScreen(this.currentfilters,this.saveFilters);

  final Map<String,bool>currentfilters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
   @override
   iniState(){
     bool _glutenFree = widget.currentfilters['gluten'];
     bool _lactoseFree =widget.currentfilters['lactose'];
     bool _vegan = widget.currentfilters['vegan'];
     bool _vegetarian = widget.currentfilters['vegetarian'];
     super.initState();
   }

  Widget buildListTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: <Widget>[
         IconButton(
          icon: Icon(Icons.save),
           onPressed: (){
            final Map<String,bool> selectedfilters = {
            'gluten' :_glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,

            };

            widget.saveFilters(selectedfilters);
           },

         ),
        ],),

      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildListTile(
                  'Gluten-free',
                  "Only include gluten-free meals.",
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildListTile(
                  'Lactose-free',
                  "Only include Lactose-free meals.",
                  _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                buildListTile(
                  'Vegetarian',
                  "Only include Vegetarian meals.",
                  _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildListTile(
                  'Vegan',
                  "Only include Vegan meals.",
                  _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),

              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
