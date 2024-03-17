import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pile_up/core/widgets/drawer.dart';
import 'package:pile_up/features/e_commerce_screen/e_commerce_screen.dart';
import 'package:pile_up/features/messages_screen/presentation/messages_screen.dart';
import 'package:pile_up/features/my_profile_screen/presentation/my_profile_screen.dart';

import 'core/resource_manager/colors.dart';
import 'features/matching_screen/presentation/matching_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static int mainIndex = 2;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      const MyProfileScreen(),
      const ECommerceScreen(),
      const MatchingScreen(),
      const MessagesScreen(),
      // const HomeScreen(),
      // const HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryColor,
        icon: Icon(Icons.person, size: 30.h),
        inactiveIcon: Icon(Icons.person_outline, size: 30.h),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryColor,
        icon: Icon(Icons.shopping_bag_rounded, size: 30.h),
        inactiveIcon: Icon(Icons.shopping_bag_outlined, size: 30.h),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryColor,
        icon: Icon(Icons.local_fire_department, size: 30.h),
        inactiveIcon: Icon(Icons.local_fire_department_outlined, size: 30.h),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryColor,
        icon: Icon(Icons.message, size: 30.h),
        inactiveIcon: Icon(Icons.message_outlined, size: 30.h),
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.local_fire_department, size: 30.h),
      //   inactiveIcon: Icon(Icons.local_fire_department_outlined, size: 30.h),
      // ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(Icons.local_fire_department, size: 30.h),
      //   inactiveIcon: Icon(Icons.local_fire_department_outlined, size: 30.h),
      // ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: MainScreen.mainIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      drawerScrimColor: AppColors.greyColor,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,

        // backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.slowMiddle,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.bounceInOut,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
