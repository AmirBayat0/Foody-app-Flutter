import 'package:flutter/material.dart';


import '../model/meal.dart';
import '../animation/fadeanimation.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  final dynamic changeIndex;

  FavoritesScreen(this.favoriteMeal,this.changeIndex);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.favoriteMeal.isEmpty
            ? SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeAnimation(
                      delay: 1,
                      positioned: -40.0,
                      child: const Text(
                          "You have no favorites yet \nStart adding some!",style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,),
                    ),
                    FadeAnimation(
                      delay: 2,
                      positioned: -50.0,
                      
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.changeIndex();
                            
                          });
                          
                        },
                        icon: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              )
            : ListView.builder(
                itemCount: widget.favoriteMeal.length,
                itemBuilder: (ctx, index) {
                  return FadeAnimation(
                    delay: 0.5 * index,
                    positioned: -30.0,
                    child: MealItem(
                      id: widget.favoriteMeal[index].id,
                      title: widget.favoriteMeal[index].title,
                      imgurl: widget.favoriteMeal[index].imageUrl,
                      duration: widget.favoriteMeal[index].duration,
                      complexity: widget.favoriteMeal[index].complexity,
                      affordability: widget.favoriteMeal[index].affordability,
                    ),
                  );
                }),
      ),
    );
  }
}
