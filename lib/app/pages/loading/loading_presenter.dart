import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_local_user_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoadingPresenter extends Presenter {
  Function? getLocalUserOnNext;
  Function? getLocalUserOnError;
  Function? getLocalUserOnComplete;

  final GetLocalUserUseCase _getLocalUserUseCase;

  LoadingPresenter(UserRepository userRepository)
      : _getLocalUserUseCase = GetLocalUserUseCase(userRepository);

  @override
  void dispose() {
    _getLocalUserUseCase.dispose();
  }

  void getLocalUser() {
    _getLocalUserUseCase.execute(_GetLocalUserObserver(this));
  }
}

class _GetLocalUserObserver extends Observer<GetLocalUserUseCaseResponse> {
  LoadingPresenter loadingPresenter;

  _GetLocalUserObserver(this.loadingPresenter);

  @override
  void onComplete() {
    assert(loadingPresenter.getLocalUserOnComplete != null);
    loadingPresenter.getLocalUserOnComplete!();
  }

  @override
  void onError(e) {
    assert(loadingPresenter.getLocalUserOnError != null);
    loadingPresenter.getLocalUserOnError!(e);
  }

  @override
  void onNext(GetLocalUserUseCaseResponse? response) {
    assert(loadingPresenter.getLocalUserOnNext != null);
    loadingPresenter.getLocalUserOnNext!(response);
  }
}
