// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../screens/detail_meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  
  MealItem({
    required this.id,
    required this.title,
    required this.imgurl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(DetailMealScreen.routeName, arguments: id)
        .then((value) {
      if (value != null) {
        // removeItem(value);
      }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';

      case Complexity.challenging:
        return 'Challenging';

      case Complexity.hard:
        return 'Hard';

      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';

      case Affordability.pricey:
        return 'Pricey';

      case Affordability.luxurious:
        return 'Expensive';

      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Hero(
                  tag: id,
                  child: ClipRRect(
                    child: Image.asset(
                      imgurl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 320,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "$duration min",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        complexityText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        affordabilityText,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
