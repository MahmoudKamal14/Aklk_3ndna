// ignore_for_file: must_be_immutable

import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/functions/show_toast.dart';
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
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Container(
              color: Color(0xffFFFEEE),
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  arrowFavorite(model: model),
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
              onPressed: () {
                AppCubit.get(context).addMealsToTheCart(
                    name: model.name!,
                    price: model.price!,
                    description: model.description!,
                    photo: model.photo!,
                    rate: model.rate!,
                    isLiked: true);
                showToast(
                    msg: 'تم إضافة ${model.name!} إلي سلة الشراء',
                    color: Colors.green);
              },
              width: 120,
            ),
          ],
        ),
      ),
    );
  }
}
