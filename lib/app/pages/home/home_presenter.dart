import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_posts_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  Function? getPostsOnNext;
  Function? getPostsOnError;
  Function? getPostsOnComplete;

  final GetPostsUseCase _getPostsUseCase;

  HomePresenter(PostRepository postRepository)
      : _getPostsUseCase = GetPostsUseCase(postRepository);

  @override
  void dispose() {
    _getPostsUseCase.dispose();
  }

  void getPosts(int quantity) {
    _getPostsUseCase.execute(
        _GetPostsUseCaseObserver(this), GetPostsParams(quantity: quantity));
  }
}

class _GetPostsUseCaseObserver implements Observer<GetPostsResponse> {
  final HomePresenter homePresenter;
  _GetPostsUseCaseObserver(this.homePresenter);

  @override
  void onComplete() {
    assert(homePresenter.getPostsOnComplete != null);
    homePresenter.getPostsOnComplete!();
  }

  @override
  void onError(e) {
    assert(homePresenter.getPostsOnError != null);
    homePresenter.getPostsOnError!();
  }

  @override
  void onNext(GetPostsResponse? response) {
    assert(homePresenter.getPostsOnNext != null);
    homePresenter.getPostsOnNext!(response);
  }
}
