// ignore_for_file: must_be_immutable

import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/components_of_meals.dart';
import 'package:aklk_3ndna/generated/l10n.dart';

import 'package:flutter/material.dart';

class CustomMealDetails extends StatelessWidget {
  CustomMealDetails({super.key, required this.model});

  MealModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0xffFFFEEE),
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                arrowFavorite(),
                imageMeal(model: model),
                mealNameRate(model: model),
                nomOfMeals(model: model),
                priceMeal(model: model),
              ],
            ),
          ),
          mealDescription(model: model),
          CustomButton(
            text: S.of(context).orderNow,
            onPressed: () {},
            width: 120,
          ),
        ],
      ),
    );
  }
}
