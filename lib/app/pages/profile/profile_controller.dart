import 'package:el_carpintero_moderno_app/app/pages/profile/profile_presenter.dart';
import 'package:el_carpintero_moderno_app/app/widgets/snackbar.dart';
import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_local_user_usecase.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/remove_local_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/entities/user.dart';

class ProfileController extends Controller {
  final ProfilePresenter profilePresenter;
  User? user;
  bool isLoading = true;

  ProfileController(UserLocalRepository userLocalRepository)
      : profilePresenter = ProfilePresenter(userLocalRepository);

  @override
  void onInitState() {
    super.onInitState();
    profilePresenter.getUser();
  }

  @override
  void initListeners() {
    profilePresenter.getUserOnComplete = () {};
    profilePresenter.getUserOnError = getUserOnError;
    profilePresenter.getUserOnNext = getUserOnNext;

    profilePresenter.removeUserOnComplete = () {};
    profilePresenter.removeUserOnError = () {};
    profilePresenter.removeUserOnNext = removeUserOnNext;
  }

  void getUserOnNext(GetLocalUserUseCaseResponse response) {
    user = response.user;
    isLoading = false;
    refreshUI();
  }

  void getUserOnError(e) {
    isLoading = false;
    refreshUI();
  }

  void removeUserOnNext(RemoveLocalUserResponse response) {
    ScaffoldMessenger.of(response.context)
        .showSnackBar(appSnackBar("Haz cerrado sesión."));
    Navigator.pushReplacementNamed(response.context, "/login");
  }

  void logout(BuildContext context) {
    profilePresenter.removeUser(context);
  }
}
