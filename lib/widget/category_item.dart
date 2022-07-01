import 'package:flutter/material.dart';
import '../Screens/meals_screen.dart';

class Category_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const Category_item(this.id, this.title, this.color);
  void select(BuildContext ctx){
    Navigator.of(ctx).pushNamed(meals_screen.routeName,
      arguments: {
      'id':id,
        'title':title,
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> select(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
