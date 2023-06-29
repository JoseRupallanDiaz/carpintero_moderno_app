import 'package:el_carpintero_moderno_app/app/pages/home/home_view.dart';
import 'package:el_carpintero_moderno_app/app/router_app.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RouterApp router = RouterApp();
    return MaterialApp(
      title: 'Chile Gaming',
      theme: AppTheme.theme,
      home: const HomeView(),
      onGenerateRoute: router.getRoute,
      navigatorObservers: [router.routeObserver],
    );
  }
}
