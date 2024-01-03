import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/features/cart/presentaion/widgets/build_meal_cart_item.dart';
import 'package:aklk_3ndna/features/payment/presentation/payment_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (AppCubit.get(context).allMealsCart.isNotEmpty) {
          return Column(
            children: [
              SizedBox(
                height: height * 0.8,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildMealCartItem(
                      AppCubit.get(context).allMealsCart[index], context),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: AppCubit.get(context).allMealsCart.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentInfo(),
                      ),
                    );
                  },
                  text: S.of(context).orderNow,
                  textColor: Colors.white,
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('لا توجد وجبات في سلة المشتريات'),
          );
        }
      },
    );
  }
}
