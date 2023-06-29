import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:el_carpintero_moderno_app/app/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../posts/posts_view.dart';

class HomeController extends Controller {
  int currentIndex = 0;

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  final navigationItems = [
    BootstrapIcons.house_fill,
    BootstrapIcons.search,
    BootstrapIcons.plus_square_fill,
    BootstrapIcons.bell_fill,
    BootstrapIcons.person_circle
  ];

  final pages = [
    const PostsView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView(),
  ];

  void itemOnClick(int index) {
    currentIndex = index;
    refreshUI();
  }

  List<BottomNavigationBarItem> getNavbarItems() {
    return [
      for (var value in navigationItems)
        BottomNavigationBarItem(
          icon: Icon(value),
          label: "a",
        )
    ];
  }
}
