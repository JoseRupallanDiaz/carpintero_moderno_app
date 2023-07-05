import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_local_user_usecase.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/remove_local_user_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfilePresenter extends Presenter {
  Function? getUserOnNext;
  Function? getUserOnComplete;
  Function? getUserOnError;

  Function? removeUserOnNext;
  Function? removeUserOnComplete;
  Function? removeUserOnError;

  final GetLocalUserUseCase _getLocalUserUseCase;
  final RemoveLocalUserUseCase _removeLocalUserUseCase;

  ProfilePresenter(UserRepository userRepository)
      : _getLocalUserUseCase = GetLocalUserUseCase(userRepository),
        _removeLocalUserUseCase = RemoveLocalUserUseCase(userRepository);

  @override
  void dispose() {
    _getLocalUserUseCase.dispose();
    _removeLocalUserUseCase.dispose();
  }

  void getUser() {
    _getLocalUserUseCase.execute(GetLocalUserObserver(this));
  }

  void removeUser(BuildContext context) {
    _removeLocalUserUseCase.execute(
        RemoveLocalUserObserver(this), RemoveLocalUserParams(context: context));
  }
}

class GetLocalUserObserver extends Observer<GetLocalUserUseCaseResponse> {
  final ProfilePresenter profilePresenter;

  GetLocalUserObserver(this.profilePresenter);
  @override
  void onComplete() {
    assert(profilePresenter.getUserOnComplete != null);
    profilePresenter.getUserOnComplete!();
  }

  @override
  void onError(e) {
    assert(profilePresenter.getUserOnError != null);
    profilePresenter.getUserOnError!(e);
  }

  @override
  void onNext(GetLocalUserUseCaseResponse? response) {
    assert(profilePresenter.getUserOnNext != null);
    profilePresenter.getUserOnNext!(response);
  }
}

class RemoveLocalUserObserver extends Observer<RemoveLocalUserResponse> {
  final ProfilePresenter profilePresenter;

  RemoveLocalUserObserver(this.profilePresenter);
  @override
  void onComplete() {
    assert(profilePresenter.removeUserOnComplete != null);
    profilePresenter.removeUserOnComplete!();
  }

  @override
  void onError(e) {
    assert(profilePresenter.removeUserOnError != null);
    profilePresenter.removeUserOnError!(e);
  }

  @override
  void onNext(RemoveLocalUserResponse? response) {
    assert(profilePresenter.removeUserOnNext != null);
    profilePresenter.removeUserOnNext!(response);
  }
}
