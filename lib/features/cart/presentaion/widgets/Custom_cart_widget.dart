import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/features/cart/presentaion/widgets/build_meal_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (AppCubit.get(context).allMealsCart.isNotEmpty) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildMealCartItem(
                AppCubit.get(context).allMealsCart[index], context),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: AppCubit.get(context).allMealsCart.length,
          );
        } else {
          return const Center(child: Text('لا توجد وجبات في سلة المشتريات'));
        }
      },
    );
  }
}
