import 'package:flutter/material.dart';
import './dummy.dart';
import './modules/meal.dart';
import './Screens/Filters_screen.dart';
import './Screens/meal_detail_screen.dart';
import './Screens/meals_screen.dart';
import './Screens/tabs_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters= {
    'gluten' :false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,

  };
  List<Meal> _avilableMeals=DUMMY_MEALS;
  List<Meal>  _favoriteMeals=[];


  void _set_Filters(Map<String,bool> _filterdata){
    setState(() {
      _filters =_filterdata;

      _avilableMeals = DUMMY_MEALS.where((meal) {
        if( _filters['gluten']==true && meal.isGlutenFree==false){
          return false;
        } ;
        if( _filters['lactose']==true && meal.isLactoseFree ==false){
          return false;
        } ;
        if( _filters['vegan']==true && meal.isVegan==false){
          return false;
        } ;
        if( _filters['vegetarian']==true && meal.isVegetarian==false){
          return false;
        }
        return true;

      }).toList();
    });

  }
  void _toggle(String mealId){
    final eIndex= _favoriteMeals.indexWhere((meal)=>meal.id==mealId);
    if(eIndex >=0){
      setState(() {
        _favoriteMeals.removeAt(eIndex);
      });
    }
    
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
  bool _MealFavorite(String id){
    return _favoriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 52, 50, 1)
              ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 52, 50, 1)
            ),
                subtitle1: TextStyle(
                  fontSize: 20,
                  fontFamily:'RobotoCondensed',
                  fontWeight: FontWeight.bold,

          )


      )

      ),
     // home: MyHomePage(),
    //  home: Screen(),
      routes: {
        '/':(ctx) => TabsScreen(_favoriteMeals),
        meals_screen.routeName:(context)=>meals_screen(_avilableMeals),
        MealDetailScreen.routName:(context)=>MealDetailScreen( _toggle, _MealFavorite),
        FiltersScreen.routeName:(context)=>FiltersScreen(_filters,_set_Filters),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: null,
    );
  }
}
