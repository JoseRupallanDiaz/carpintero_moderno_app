import 'package:el_carpintero_moderno_app/app/pages.dart';
import 'package:el_carpintero_moderno_app/app/pages/home/home_view.dart';
import 'package:flutter/material.dart';

class RouterApp {
  final RouteObserver<PageRoute> routeObserver;
  RouterApp() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    // Pantallas publicas
    switch (settings.name) {
      case Pages.home:
        return _buildRoute(settings, const HomeView());
    }
    //Default page
    return _buildRoute(settings, const HomeView());
  }

  MaterialPageRoute<dynamic> _buildRoute(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
        builder: (BuildContext ctx) => builder, settings: settings);
  }
}
