import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:el_carpintero_moderno_app/data/remote/user_remote_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_remote_user_usecase.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/save_local_user_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';

class LoginPresenter extends Presenter {
  Function? loginOnComplete;
  Function? loginOnNext;
  Function? loginOnError;

  Function? saveUserOnComplete;
  Function? saveUserOnNext;
  Function? saveLocalUserOnError;

  final GetRemoteUserUseCase _getTokenUseCase;
  final SaveLocalUserUseCase _saveLocalUserUseCase;

  LoginPresenter(UserRemoteRepository userRemoteRepository,
      UserLocalRepository userLocalRepository)
      : _getTokenUseCase = GetRemoteUserUseCase(userRemoteRepository),
        _saveLocalUserUseCase = SaveLocalUserUseCase(userLocalRepository);

  @override
  void dispose() {
    _getTokenUseCase.dispose();
    _saveLocalUserUseCase.dispose();
  }

  void login(String email, String password) {
    _getTokenUseCase.execute(
        GetRemoteUserObserver(this),
        GetRemoteUserUseCaseParams(
          email: email,
          password: password,
        ));
  }

  void saveUser(User user) {
    _saveLocalUserUseCase.execute(
        SaveLocalUserObserver(this), SaveLocalUserParams(user: user));
  }
}

class GetRemoteUserObserver implements Observer<GetRemoteUserUseCaseResponse> {
  final LoginPresenter loginPresenter;
  GetRemoteUserObserver(this.loginPresenter);

  @override
  void onComplete() {
    assert(loginPresenter.loginOnComplete != null);
    loginPresenter.loginOnComplete!();
  }

  @override
  void onError(e) {
    assert(loginPresenter.loginOnError != null);
    loginPresenter.loginOnError!(e);
  }

  @override
  void onNext(GetRemoteUserUseCaseResponse? response) {
    assert(loginPresenter.loginOnNext != null);
    loginPresenter.loginOnNext!(response);
  }
}

class SaveLocalUserObserver implements Observer<SaveLocalUserResponse> {
  final LoginPresenter loginPresenter;
  SaveLocalUserObserver(this.loginPresenter);

  @override
  void onComplete() {
    assert(loginPresenter.saveUserOnComplete != null);
    loginPresenter.saveUserOnComplete!();
  }

  @override
  void onError(e) {
    assert(loginPresenter.saveLocalUserOnError != null);
    loginPresenter.saveLocalUserOnError!(e);
  }

  @override
  void onNext(SaveLocalUserResponse? response) {
    assert(loginPresenter.saveUserOnNext != null);
    loginPresenter.saveUserOnNext!(response);
  }
}
