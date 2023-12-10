import 'package:aklk_3ndna/core/cubit/internet_connection/internet_connection_cubit.dart';
import 'package:aklk_3ndna/core/utils/app_assets.dart';
import 'package:aklk_3ndna/core/widgets/custom_button.dart';
import 'package:aklk_3ndna/core/widgets/custom_image.dart';
import 'package:aklk_3ndna/features/no_internet/presentation/widgets/custom_text_internet.dart';
import 'package:aklk_3ndna/features/no_internet/presentation/widgets/no_internet_sub_title.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Center(child: CustomImage(url: Assets.imagesNoInternet)),
          const SizedBox(height: 150),
          CustomTextNoInternet(text: S.of(context).oops),
          const SizedBox(height: 5),
          CustomTextNoInternet(text: S.of(context).noInternet),
          const SizedBox(height: 15),
          InternetSubTitle(),
          const SizedBox(height: 30),
          CustomButton(
              text: S.of(context).TyrAgain,
              width: 300,
              onPressed: () {
                //! BlocProvider
                InternetConnectionCubit.get(context).checkConnectivity();
              }),
        ],
      ),
    );
  }
}
