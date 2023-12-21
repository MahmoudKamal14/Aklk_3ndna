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
                if (n >= 1) {
                  n--;
                }
              });
            },
            icon: const Icon(
              CupertinoIcons.minus_circle_fill,
              size: 30,
            ),
            color: const Color(0xffD85E2C),
          ),
          Text(
            '$n',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                if (n >= 0) {
                  n++;
                }
              });
            },
            icon: const Icon(
              CupertinoIcons.add_circled_solid,
              size: 30,
            ),
            color: const Color(0xffD85E2C),
          ),
          Spacer(),
          Size_buttons(),
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
    return Container(
      height: 200,
      width: 220,
      color: Color(0xffFFFEEE),
      child: Image(
        image: NetworkImage(model.photo!),
      ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            model.name!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Spacer(),
          Container(
            color: const Color(0xffD85E2C),
            width: 80,
            height: 30,
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
                  Icons.star_rate,
                  color: Color(0xffFFFEEE),
                  size: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class arrowFavorite extends StatelessWidget {
  const arrowFavorite({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xffD85E2C),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xffFFFEEE),
              ),
            ),
          ),
          Spacer(),
          Container(
            color: const Color(0xffD85E2C),
            child: IconButton(
              onPressed: () {
                AppCubit.get(context).setAllMealsFavorite(
                    name: model.name!,
                    price: model.price!,
                    description: model.description!,
                    photo: model.photo!,
                    rate: model.rate!,
                    isLiked: true);
                showToast(
                    msg: 'تم إضافة ${model.name!} إلي المفضلة',
                    color: Colors.green);
              },
              icon: Icon(
                Icons.favorite_sharp,
                size: 30,
                color: model.isLiked == true ? Colors.red : Colors.white,
              ),
            ),
          ),
        ],
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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
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
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Size_buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(width: 1.8, color: const Color(0xffD85E2C)),
                ),
                child: const Center(
                  child: Text(
                    "S",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(width: 1.8, color: const Color(0xffD85E2C)),
                ),
                child: const Center(
                  child: Text(
                    "M",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(width: 1.8, color: const Color(0xffD85E2C)),
                ),
                child: const Center(
                  child: Text(
                    "L",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
