import 'package:flutter/material.dart';

import '../animation/fadeanimation.dart';
import '../model/category.dart';
import '../widget/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(25),
        itemCount: categoryModel.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (ctx, index) {
          CategoryModel catData = categoryModel[index];
          return FadeAnimation(
            delay: 0.5 * index,
            positioned: 30.0,
            child: CategoryItem(
              title: catData.title,
              color: catData.color,
              id: catData.id,
            ),
          );
        },
      ),
    );
  }
}
