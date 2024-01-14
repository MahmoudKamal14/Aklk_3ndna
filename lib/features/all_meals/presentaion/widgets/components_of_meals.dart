// ignore_for_file: must_be_immutable

import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/functions/show_toast.dart';
import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class priceMeal extends StatelessWidget {
  const priceMeal({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        model.price!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}

class nomOfMeals extends StatefulWidget {
  nomOfMeals({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  State<nomOfMeals> createState() => _nomOfMealsState();
}

class _nomOfMealsState extends State<nomOfMeals> {
  late int n = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (n > 1) {
                  n--;
                }
              });
            },
            icon: const Icon(
              CupertinoIcons.minus_rectangle_fill,
              size: 25,
            ),
            color: const Color(0xffD85E2C),
          ),
          Text(
            '$n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                n++;
              });
            },
            icon: const Icon(
              CupertinoIcons.plus_rectangle_fill,
              size: 25,
            ),
            color: const Color(0xffD85E2C),
          ),
        ],
      ),
    );
  }
}

class imageMeal extends StatelessWidget {
  const imageMeal({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(model.photo!),
      width: 300,
    );
  }
}

class mealNameRate extends StatelessWidget {
  const mealNameRate({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          model.name!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Container(
          height: 30,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffD85E2C)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.rate!,
                style: TextStyle(
                  color: Color(0xffFFFEEE),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                CupertinoIcons.star_fill,
                color: Color(0xffFFFEEE),
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class arrow extends StatelessWidget {
  const arrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xffFFFEEE),
        ),
      ),
    );
  }
}

class mealDescription extends StatelessWidget {
  const mealDescription({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.of(context).MealDetails,
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  model.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget customFavorite(MealModel model, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          AppCubit.get(context).setAllMealsFavorite(
            name: model.name!,
            price: model.price!,
            description: model.description!,
            photo: model.photo!,
            rate: model.rate!,
            isLiked: true,
          );
          showToast(
            msg: 'تم إضافة ${model.name!} إلي المفضلة',
            color: Colors.green,
          );
        },
        icon: Icon(
          AppCubit.get(context).colorIcon == false
              ? CupertinoIcons.heart_fill
              : Icons.favorite,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
