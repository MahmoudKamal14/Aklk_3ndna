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
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffD85E2C),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Positioned(
              child: arrow(),
              top: 0,
              left: 0,
            ),
            Positioned(
              child: customFavorite(model, context),
              top: 0,
              right: 0,
            ),
            Positioned(
              bottom: 0,
              height: 550,
              width: 393,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFFEEE),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    //
                    SizedBox(
                      height: 130,
                    ),
                    mealNameRate(model: model),
                    nomOfMeals(model: model),
                    priceMeal(model: model),
                    mealDescription(model: model),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomButton(
                        color: Color(0xffD85E2C),
                        text: S.of(context).orderNow,
                        textColor: Colors.white,
                        onPressed: () {
                          AppCubit.get(context).addMealsToTheCart(
                            name: model.name!,
                            price: model.price!,
                            description: model.description!,
                            photo: model.photo!,
                            rate: model.rate!,
                            isLiked: true,
                          );
                          showToast(
                              msg: 'تم إضافة ${model.name!} إلي سلة المشتريات',
                              color: Colors.green);
                        },
                        width: 250,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(bottom: 450, right: 15, child: imageMeal(model: model)),
          ],
        ),
      ),
    );
  }
}
