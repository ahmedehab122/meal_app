import 'package:flutter/material.dart';
import 'package:meal_app/widget/category_item.dart';
import '../dummy.dart';


class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: GridView(
        padding: EdgeInsets.all(25),
        children:DUMMY_CATEGORIES.map((catDate) =>
            Category_item(catDate.id,catDate.title,catDate.color),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
