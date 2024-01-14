// ignore_for_file: must_be_immutable

import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/core/cubit/app_cubit/app_states.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/widgets/build_meal_item.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  var searchController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).cardColor, //Color(0xffefebf4)
          appBar: AppBar(
            title: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 4,
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        validator: (v) {
                          if (v!.isEmpty) {
                            AppCubit.get(context).resultSearch.clear();

                            return 'Search Can\'t be Empty';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          if (formKey.currentState!.validate()) {
                            AppCubit.get(context).Search(value);
                            print(
                              AppCubit.get(context).resultSearch,
                            );
                          }
                        },
                        decoration: InputDecoration(
                          hintText: '${S.of(context).Findyourfavoritemeals}',
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Builder(builder: (context) {
              return listOfItemSearch(context);
            }),
          ),
        );
      },
    );
  }

  Widget listOfItemSearch(BuildContext context) {
    if (AppCubit.get(context).resultSearch.isNotEmpty) {
      return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildMealItem(
            AppCubit.get(context).resultSearch.elementAt(index), context),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: AppCubit.get(context).resultSearch.length,
      );
    } else {
      return Center(
          child: Text(
        '',
        style: TextStyle(color: Theme.of(context).cardColor, fontSize: 28),
      ));
    }
  }
}
