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
          color: Theme.of(context).cardColor,
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
                  textFirebase(model, text: '${model.name}', context: context),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      textFirebase(model,
                          text: '${model.price}', context: context),
                      SizedBox(
                        width: 60,
                      ),
                      iconStart(),
                      SizedBox(
                        width: 5,
                      ),
                      textFirebase(model,
                          text: '${model.rate}', context: context),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget textFirebase(MealModel model,
        {required String text, required BuildContext context}) =>
    Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
      maxLines: 2,
      overflow: TextOverflow.clip,
    );

Widget iconStart() => Icon(Icons.star_rate, color: Colors.yellow);
