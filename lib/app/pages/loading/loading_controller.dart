import 'package:el_carpintero_moderno_app/app/pages/loading/loading_presenter.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_local_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoadingController extends Controller {
  LoadingPresenter loadingPresenter;
  bool isLoading = false;

  LoadingController(UserRepository userRepository)
      : loadingPresenter = LoadingPresenter(userRepository);

  @override
  void onInitState() {
    super.onInitState();
    Future.delayed(
      const Duration(seconds: 2),
      (() {
        isLoading = true;
        refreshUI();
        loadingPresenter.getLocalUser();
      }),
    );
  }

  @override
  void initListeners() {
    loadingPresenter.getLocalUserOnComplete = () {};
    loadingPresenter.getLocalUserOnError = getLocalUserOnError;
    loadingPresenter.getLocalUserOnNext = getLocalUserOnNext;
  }

  void getLocalUserOnNext(GetLocalUserUseCaseResponse response) {
    isLoading = false;
    refreshUI();
    if (response.user != null) {
      Navigator.pushReplacementNamed(getContext(), "/home");
    } else {
      Navigator.pushReplacementNamed(getContext(), "/login");
    }
  }

  void getLocalUserOnError(e) {
    isLoading = false;
    refreshUI();
    Navigator.pushReplacementNamed(getContext(), "/login");
  }
}
