import 'package:flutter/material.dart';
import '../modules/meal.dart';
import '../widget/meal_item.dart';


class meals_screen extends StatefulWidget {
  static const routeName = 'meals';
  final List<Meal> avilableMeals;
   meals_screen(this.avilableMeals);

  @override
  _meals_screenState createState() => _meals_screenState();
}

class _meals_screenState extends State<meals_screen> {
  String categoryTitle;
  List<Meal> displayMeals;
  @override
  void didChangeDependencies() {
    final routArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    categoryTitle = routArg['title'];
    displayMeals = widget.avilableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }


  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return meal_item(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,

          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
