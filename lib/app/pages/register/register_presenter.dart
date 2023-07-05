import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/post_user_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';

class RegisterPresenter extends Presenter {
  Function? registerOnNext;
  Function? registerOnError;
  Function? registerOnComplete;

  final PostUserUseCase _postUserUseCase;

  RegisterPresenter(UserRepository userRepository)
      : _postUserUseCase = PostUserUseCase(userRepository);

  @override
  void dispose() {
    _postUserUseCase.dispose();
  }

  void register(User user) {
    _postUserUseCase.execute(
        _PostUseCaseObserver(this), PostUserParams(user: user));
  }
}

class _PostUseCaseObserver implements Observer<PostUserResponse> {
  final RegisterPresenter registerPresenter;
  _PostUseCaseObserver(this.registerPresenter);

  @override
  void onComplete() {
    assert(registerPresenter.registerOnComplete != null);
    registerPresenter.registerOnComplete!();
  }

  @override
  void onError(e) {
    assert(registerPresenter.registerOnError != null);
    registerPresenter.registerOnError!(e);
  }

  @override
  void onNext(PostUserResponse? response) {
    assert(registerPresenter.registerOnNext != null);
    registerPresenter.registerOnNext!(response);
  }
}
