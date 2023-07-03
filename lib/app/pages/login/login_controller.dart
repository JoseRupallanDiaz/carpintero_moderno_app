import 'package:el_carpintero_moderno_app/app/widgets/snackbar.dart';
import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:el_carpintero_moderno_app/data/remote/user_remote_repository.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_remote_user_usecase.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/save_local_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'login_presenter.dart';

class LoginController extends Controller {
  final LoginPresenter loginPresenter;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;

  LoginController(UserRemoteRepository userRemoteRepository,
      UserLocalRepository userLocalRepository)
      : loginPresenter =
            LoginPresenter(userRemoteRepository, userLocalRepository);

  @override
  void initListeners() {
    loginPresenter.saveUserOnComplete = () {
      isLoading = false;
      refreshUI();
    };
    loginPresenter.saveLocalUserOnError = saveLocalUserOnError;
    loginPresenter.saveUserOnNext = saveLocalUserOnNext;

    loginPresenter.loginOnComplete = () {
      isLoading = false;
      refreshUI();
    };
    loginPresenter.loginOnError = loginOnError;
    loginPresenter.loginOnNext = loginOnNext;
  }

  void loginOnNext(GetRemoteUserUseCaseResponse response) {
    ScaffoldMessenger.of(getContext())
        .showSnackBar(appSnackBar("Credenciales correctas."));
    loginPresenter.saveUser(response.user);
  }

  void loginOnError(e) {
    isLoading = false;
    refreshUI();
    ScaffoldMessenger.of(getContext()).showSnackBar(appSnackBar("Error $e"));
  }

  void saveLocalUserOnNext(SaveLocalUserResponse response) {
    ScaffoldMessenger.of(getContext())
        .showSnackBar(appSnackBar("Inicio de sesión exitoso!"));
    Navigator.pushReplacementNamed(getContext(), "/home");
  }

  void saveLocalUserOnError(e) {
    isLoading = false;
    refreshUI();
    ScaffoldMessenger.of(getContext())
        .showSnackBar(appSnackBar("Error al guardar usuario. $e"));
  }

  void login() {
    isLoading = true;
    refreshUI();
    loginPresenter.login(email.text, password.text);
  }
}
