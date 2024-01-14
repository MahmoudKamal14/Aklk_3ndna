import 'package:aklk_3ndna/core/cubit/app_cubit/app_cubit.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/views/all_meals_view.dart';
import 'package:aklk_3ndna/features/cart/presentaion/views/cart_view.dart';
import 'package:aklk_3ndna/features/favorite/presentation/view/favorite.dart';
import 'package:aklk_3ndna/features/home/presentation/logic/bottom_nav_bar_cubit.dart';
import 'package:aklk_3ndna/features/home/presentation/view/homeView.dart';
import 'package:aklk_3ndna/features/settings/presentation/views/Settings_view.dart';
import 'package:aklk_3ndna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> screens = const [
    const HomeView(),
    const AllMealsView(),
    const CartView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  void onPageChanged(int page) {
    BlocProvider.of<BottomNavBarCubit>(context).changeSelectedIndex(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  _buildBody() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PageView(
        onPageChanged: (int page) => onPageChanged(page),
        controller: pageController,
        children: screens,
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  BottomAppBar _bottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).cardColor,
      height: MediaQuery.of(context).size.height * 0.083,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSingleNavBarBottom(
              context,
              defaultIcon: IconlyLight.home,
              page: 0,
              label: "${S.of(context).home}",
              filledIcon: IconlyBold.home,
            ),
            _buildSingleNavBarBottom(
              context,
              defaultIcon: IconlyLight.category,
              page: 1,
              label: "${S.of(context).allMeals}",
              filledIcon: IconlyBold.category,
            ),
            _buildSingleNavBarBottom(
              context,
              defaultIcon: IconlyLight.buy,
              page: 2,
              label: "${S.of(context).cart}",
              filledIcon: IconlyBold.buy,
            ),
            _buildSingleNavBarBottom(
              context,
              defaultIcon: IconlyLight.heart,
              page: 3,
              label: "${S.of(context).favorite}",
              filledIcon: IconlyBold.heart,
            ),
            _buildSingleNavBarBottom(
              context,
              defaultIcon: IconlyLight.setting,
              page: 4,
              label: "${S.of(context).Settings}",
              filledIcon: IconlyBold.setting,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleNavBarBottom(
    BuildContext context, {
    required defaultIcon,
    required page,
    required label,
    required filledIcon,
  }) {
    return GestureDetector(
      onTap: () {
        if (page == 3) AppCubit.get(context).getAllMealsFavorite();
        if (page == 2) AppCubit.get(context).getAllMealsCart();
        BlocProvider.of<BottomNavBarCubit>(context).changeSelectedIndex(page);
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Column(
        children: [
          Icon(
            context.watch<BottomNavBarCubit>().state == page
                ? filledIcon
                : defaultIcon,
            color: context.watch<BottomNavBarCubit>().state == page
                ? Colors.amber
                : Colors.grey,
            size: MediaQuery.of(context).size.width * 0.055,
          ),
          SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.aBeeZee(
              color: context.watch<BottomNavBarCubit>().state == page
                  ? Colors.amber
                  : Colors.grey,
              fontSize: MediaQuery.of(context).size.width * 0.03,
              fontWeight: context.watch<BottomNavBarCubit>().state == page
                  ? FontWeight.w600
                  : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
