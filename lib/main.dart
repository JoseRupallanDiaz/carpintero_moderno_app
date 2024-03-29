import 'package:el_carpintero_moderno_app/app/pages/loading/loading_view.dart';
import 'package:el_carpintero_moderno_app/app/router_app.dart';
import 'package:el_carpintero_moderno_app/app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RouterApp router = RouterApp();
    return MaterialApp(
      title: 'El Carpintero Moderno',
      theme: AppTheme.theme,
      home: const LoadingView(),
      onGenerateRoute: router.getRoute,
      navigatorObservers: [router.routeObserver],
    );
  }
}
