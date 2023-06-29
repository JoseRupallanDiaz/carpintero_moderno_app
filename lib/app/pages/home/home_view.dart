import 'package:el_carpintero_moderno_app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeView extends View {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState() : super(HomeController());

  @override
  Widget get view {
    return ControlledWidgetBuilder<HomeController>(
        builder: ((context, controller) => Scaffold(
              body: SafeArea(child: controller.pages[controller.currentIndex]),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: controller.currentIndex,
                  items: controller.getNavbarItems(),
                  onTap: controller.itemOnClick,
                ),
              ),
            )));
  }
}
