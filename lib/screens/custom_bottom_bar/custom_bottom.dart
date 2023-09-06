import 'package:e_commerce_app/screens/account_screen/account_screen.dart';
import 'package:e_commerce_app/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CusttomBottomBar extends StatefulWidget {
  const CusttomBottomBar({
    final Key? key,
  }) : super(key: key);

  @override
  _CusttomBottomBarState createState() => _CusttomBottomBarState();
}

class _CusttomBottomBarState extends State<CusttomBottomBar> {
  PersistentTabController _controller = PersistentTabController();
  bool _hideNavBar = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = PersistentTabController();
  //   _hideNavBar = false;
  // }

  List<Widget> _buildScreens() => [
        const Home(),
        const CartScreen(),
        const AccountScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(Icons.home_outlined),
          title: "Home",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          inactiveIcon: const Icon(Icons.shopping_cart_outlined),
          title: "Cart",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        // PersistentBottomNavBarItem(
        //   icon: const Icon(Icons.favorite),
        //   inactiveIcon: const Icon(Icons.favorite_border_outlined),
        //   title: "Favourite",
        //   activeColorPrimary: Colors.white,
        //   inactiveColorPrimary: Colors.white,
        // ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          inactiveIcon: const Icon(Icons.person_2_outlined),
          title: "Profile",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 10,
          backgroundColor: Theme.of(context).primaryColor,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style9, // Choose the nav bar style with this property
        ),
      );
}
