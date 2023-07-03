import 'package:el_carpintero_moderno_app/app/pages/register/register_presenter.dart';
import 'package:el_carpintero_moderno_app/data/remote/user_remote_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/post_user_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';
import '../../widgets/snackbar.dart';

class RegisterController extends Controller {
  final RegisterPresenter registerPresenter;

  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController verifyPassword = TextEditingController();

  RegisterController(UserRemoteRepository userRemoteRepository)
      : registerPresenter = RegisterPresenter(userRemoteRepository);

  @override
  void initListeners() {
    registerPresenter.registerOnComplete = () {};
    registerPresenter.registerOnError = registerOnError;
    registerPresenter.registerOnNext = registerOnNext;
  }

  void registerOnNext(PostUserResponse response) {
    ScaffoldMessenger.of(getContext())
        .showSnackBar(appSnackBar("Cuenta registrada exitosamente!"));
    Navigator.pushReplacementNamed(getContext(), "/login");
  }

  void registerOnError(e) {
    ScaffoldMessenger.of(getContext()).showSnackBar(appSnackBar("Error: $e"));
  }

  void register() {
    User user = User(
      username: username.text,
      email: email.text,
      password: password.text,
    );
    return registerPresenter.register(user);
  }
}
