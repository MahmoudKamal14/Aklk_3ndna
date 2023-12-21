import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/features/home/presentation/widgets/carousel_slider.dart';
import 'package:aklk_3ndna/features/home/presentation/widgets/search_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 16, left: 5, right: 5),
            child: ListView(
              children: [
                const SearchBoxWidget(),
                const SizedBox(height: 10),
                carouselSlider(),
                SizedBox(height: 15),
              ],
            ),
          );
        });
  }
}
