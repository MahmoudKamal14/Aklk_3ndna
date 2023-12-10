import 'package:aklk_3ndna/core/cubit/internet_connection/internet_connection_cubit.dart';
import 'package:aklk_3ndna/core/cubit/internet_connection/internet_connection_state.dart';
import 'package:aklk_3ndna/features/favorite/presentation/widgets/custom_favorite_widget.dart';
import 'package:aklk_3ndna/features/no_internet/presentation/views/on_internet_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
      builder: (context, state) {
        if (state is InternetConnectedState) {
          return CustomFavoriteWidget();
        } else {
          return const NoInternetView();
        }
      },
    );
  }
}






















//  appBar: AppBar(
//             title: Text(S.of(context).signUp),
//           ),
//           body: GestureDetector(
//             onTap: () {
//               CurrentLocaleCubit.get(context).updateLanguage(value: true);
//             },
//             child: Center(child: Text('En')),
//           ),