import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/custom_meal_details.dart';
import 'package:flutter/material.dart';

Widget buildMealItem(MealModel model, context) => InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => CustomMealDetails(
              model: model,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(model.photo!),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFirebase(model, text: '${model.name}'),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        textFirebase(model, text: '${model.price}'),
                        SizedBox(
                          width: 20,
                        ),
                        textFirebase(model, text: '${model.rate}'),
                        SizedBox(
                          width: 5,
                        ),
                        if (model.rate == '1')
                          for (int i = 0; i < 1; i++) iconStart(),
                        if (model.rate == '2')
                          for (int i = 0; i < 2; i++) iconStart(),
                        if (model.rate == '3')
                          for (int i = 0; i < 3; i++) iconStart(),
                        if (model.rate == '4')
                          for (int i = 0; i < 4; i++) iconStart(),
                        if (model.rate == '5')
                          for (int i = 0; i < 5; i++) iconStart(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget textFirebase(MealModel model, {required String text}) => Text(
      text,
      style: const TextStyle(
        height: 1.4,
        fontSize: 20,
        color: Colors.black,
      ),
      maxLines: 2,
      overflow: TextOverflow.clip,
    );

Widget iconStart() => Icon(Icons.star_rate, color: Colors.yellow);
