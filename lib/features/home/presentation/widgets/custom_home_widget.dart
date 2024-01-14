import 'package:aklk_3ndna/features/home/presentation/widgets/carousel_slider.dart';
import 'package:aklk_3ndna/features/home/presentation/widgets/custom_most_popular.dart';
import 'package:aklk_3ndna/features/home/presentation/widgets/custom_most_seller.dart';
import 'package:aklk_3ndna/features/home/presentation/widgets/search_box_widget.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomHomeWidget extends StatelessWidget {
  const CustomHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        const SearchBoxWidget(),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: carouselSlider(),
        ),
        Container(
          height: 0.2,
          color: Colors.black,
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '${S.of(context).mostPopular}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Container(
          height: 240,
          width: 100,
          child: Expanded(child: CustomMostPopularWidget()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 0.2,
            color: Colors.black,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: Text(
            '${S.of(context).mostSeller}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Container(
          height: 240,
          width: 100,
          child: Expanded(child: CustomMostSellerWidget()),
        ),
      ],
    );
  }
}
