import 'package:el_carpintero_moderno_app/app/pages/loading/loading_controller.dart';
import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoadingView extends View {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends ViewState<LoadingView, LoadingController> {
  _LoadingViewState() : super(LoadingController(UserLocalRepository()));

  @override
  Widget get view {
    return ControlledWidgetBuilder<LoadingController>(
      builder: ((context, controller) => Scaffold(
            key: globalKey,
            body: Center(
                child: SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/img/ic_launcher.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  const LinearProgressIndicator(),
                ],
              ),
            )),
          )),
    );
  }
}
