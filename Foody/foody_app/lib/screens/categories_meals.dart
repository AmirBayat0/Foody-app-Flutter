import 'package:flutter/material.dart';

import '../animation/fadeanimation.dart';
import '../model/meal.dart';
import '../widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String? categoryTitle;
  late List<Meal> displayMeals;
  bool _loadInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categoryTitle!,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
            itemCount: displayMeals.length,
            itemBuilder: (ctx, index) {
              return FadeAnimation(
                delay: 0.5 * index,
                positioned: -30.0,
                child: MealItem(
                  id: displayMeals[index].id,
                  title: displayMeals[index].title,
                  imgurl: displayMeals[index].imageUrl,
                  duration: displayMeals[index].duration,
                  complexity: displayMeals[index].complexity,
                  affordability: displayMeals[index].affordability,
                  
                ),
              );
            }),
      ),
    );
  }
}
