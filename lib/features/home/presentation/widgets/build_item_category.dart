import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/functions/show_toast.dart';
import 'package:aklk_3ndna/core/models/meal_model.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/custom_meal_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget BuildItemMealCategory(MealModel model, context) => InkWell(
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
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: const Color(0xffFFFEEE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 120,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(model.photo!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    model.name!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  IconButton(
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
                        color: Colors.green,
                      );
                    },
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    model.price!,
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 25,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffD85E2C)),
                    child: Row(
                      children: [
                        Text(
                          model.rate!,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
