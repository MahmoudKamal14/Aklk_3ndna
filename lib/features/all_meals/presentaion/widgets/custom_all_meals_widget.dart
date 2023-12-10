import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAllMealsWidget extends StatelessWidget {
  const CustomAllMealsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: TextButton(
              onPressed: () {
                AppCubit.get(context).getAllMeals();
              },
              child: Text('Enter'),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
