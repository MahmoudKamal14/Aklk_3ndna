import 'package:aklk_3ndna/core/utils/app_colors.dart';
import 'package:aklk_3ndna/features/all_meals/presentaion/views/all_meals_view.dart';
import 'package:aklk_3ndna/features/cart/presentaion/views/cart_view.dart';
import 'package:aklk_3ndna/features/favorite/presentation/view/favorite.dart';
import 'package:aklk_3ndna/features/home/presentation/view/home.dart';
import 'package:aklk_3ndna/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});
  static const id = 'HomeNavBarWidget';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
        controller: _controller,
        navBarStyle: NavBarStyle.style12,
        backgroundColor: color,
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const AllMealsView(),
    const CartView(),
    const FavoriteView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      iconSize: 30,
      title: '.',
      icon: Icon(Icons.home),
      inactiveIcon: Icon(Icons.home_outlined),
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      title: '.',
      icon: const Icon(Icons.fastfood),
      inactiveIcon: const Icon(Icons.fastfood_outlined),
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      title: '.',
      icon: const Icon(Icons.shopping_cart),
      inactiveIcon: const Icon(Icons.shopping_cart_outlined),
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      title: '.',
      icon: Icon(Icons.favorite),
      inactiveIcon: Icon(Icons.favorite_outline),
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      iconSize: 30,
      title: '.',
      icon: const Icon(Icons.person),
      inactiveIcon: const Icon(Icons.person_outlined),
      inactiveColorPrimary: Colors.white,
      activeColorSecondary: Colors.black,
    ),
  ];
}
