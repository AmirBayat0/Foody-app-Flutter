import 'package:flutter/material.dart';

import '../animation/fadeanimation.dart';
import '../data/dummy_data.dart';

class DetailMealScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final dynamic toggleFavorite;
  final Function isFavorite;
  DetailMealScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline1
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

/////////////////////////////////////
/// @CodeWithFlexz on Instagram
///
/// AmirBayat0 on Github
/// Programming with Flexz on Youtube
/////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = mealModel.firstWhere((meal) => meal.id == mealId);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(selectedMeal.title)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: selectedMeal.id,
              child: Container(
                height: 300,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            FadeAnimation(
                delay: 1,
                positioned: -30.0,
                child: buildSectionTitle(context, "Ingredients")),
            FadeAnimation(
              delay: 2,
              positioned: -30.0,
              child: buildContainer(
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.deepPurpleAccent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            FadeAnimation(
                delay: 3,
                positioned: -30.0,
                child: buildSectionTitle(context, "Steps")),
            FadeAnimation(
              delay: 4,
              positioned: -30.0,
              child: buildContainer(
                  child: ListView.builder(
                      itemCount: selectedMeal.steps.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: Text("# ${index + 1}"),
                              ),
                              title: Text(selectedMeal.steps[index]),
                            ),
                            const Divider(),
                          ],
                        );
                      })),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    ));
  }
}
