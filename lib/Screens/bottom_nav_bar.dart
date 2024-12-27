// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, must_be_immutable

import 'package:demo_project/Screens/analitics_page.dart';
import 'package:demo_project/Screens/homepage.dart';
import 'package:demo_project/Helper/utility.dart';
import 'package:demo_project/Screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class PersistenBottomNavBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      screenTransitionAnimation: ScreenTransitionAnimation(
          curve: Curves.fastEaseInToSlowEaseOut,
          duration: Duration(milliseconds: 750)),
      tabs: [
        PersistentTabConfig(
          screen: HomePage(),
          item: ItemConfig(
            icon: Icon(Icons.home),
            title: "Home",
            iconSize: 30,
            textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            activeForegroundColor: DarkAppColor.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: AnaliticsPage(),
          item: ItemConfig(
            icon: Icon(Icons.stacked_line_chart),
            title: "Trending",
            iconSize: 30,
            textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            activeForegroundColor: DarkAppColor.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: ProfilePage(),
          item: ItemConfig(
            icon: Icon(Icons.person),
            title: "Profile",
            iconSize: 30,
            textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            activeForegroundColor: DarkAppColor.primaryColor,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style8BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: DarkAppColor.bgColor,
        ),
      ),
    );
  }
}
