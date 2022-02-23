
import 'package:flutter/material.dart';

import '../screens/categories_meals.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  
  CategoryItem({required this.title, required this.color, required this.id});


  void changeScreen(BuildContext context) {
      Navigator.pushNamed(context, CategoryMealsScreen.routeName,arguments: {
        'id' : id,
        'title' : title
      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => changeScreen(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding:  const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [

            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
