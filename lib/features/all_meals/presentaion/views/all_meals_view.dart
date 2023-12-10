import 'package:aklk_3ndna/core/cubit/internet_connection/internet_connection_cubit.dart';
import 'package:aklk_3ndna/core/cubit/internet_connection/internet_connection_state.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/custom_all_meals_widget.dart';
import 'package:aklk_3ndna/features/no_internet/presentation/views/on_internet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMealsView extends StatelessWidget {
  const AllMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
      builder: (context, state) {
        if (state is InternetConnectedState) {
          return CustomAllMealsWidget();
        } else {
          return const NoInternetView();
        }
      },
    );
  }
}
