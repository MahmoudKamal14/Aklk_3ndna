import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/features/home/presentation/widgets/build_item_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget CustomMostPopularWidget() {
  return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (AppCubit.get(context).allMeals.isNotEmpty) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => BuildItemMealCategory(
                AppCubit.get(context).allMeals[index], context),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: AppCubit.get(context).allMeals.length - 6,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
}
