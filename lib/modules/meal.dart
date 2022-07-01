import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String imageUrl;
  final String title;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final List<String> categories;
  final List<String> steps;
  final List<String> ingredients;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  const Meal({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.categories,
    @required this.steps,
    @required this.ingredients,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,

  });
}

 /*Meal m1 = Meal(id: null,
    imageUrl: null,
    title: null,
    isGlutenFree: null,
    isLactoseFree: null,
    isVegan: null,
    isVegetarian: null,
    categories: null,
    steps: null,
    ingredients: null,
    duration: null,
    affordability: null,
    complexity: Complexity.Simple,);*/
