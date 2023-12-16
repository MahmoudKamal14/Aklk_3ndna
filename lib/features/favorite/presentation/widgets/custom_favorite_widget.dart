import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/features/favorite/presentation/widgets/build_meal_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavoriteWidget extends StatelessWidget {
  const CustomFavoriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (AppCubit.get(context).allMealsFavorite.isNotEmpty) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildMealFavoriteItem(
                AppCubit.get(context).allMealsFavorite[index], context),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: AppCubit.get(context).allMealsFavorite.length,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
