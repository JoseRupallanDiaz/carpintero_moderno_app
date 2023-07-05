import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_posts_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/search_post_usecase.dart';

class SearchPresenter extends Presenter {
  Function? getPostsOnNext;
  Function? getPostsOnError;
  Function? getPostsOnComplete;

  Function? searchPostsOnNext;
  Function? searchPostsOnError;
  Function? searchPostsOnComplete;


  final GetPostsUseCase _getPostsUseCase;
  final SearchPostUsecase _searchPostUsecase;

  SearchPresenter(PostRepository postRepository)
      : _getPostsUseCase = GetPostsUseCase(postRepository), _searchPostUsecase = SearchPostUsecase(postRepository);

  @override
  void dispose() {
  _getPostsUseCase.dispose();
  }

  void getPosts(int quantity) {
  _getPostsUseCase.execute(
  _GetPostsUseCaseObserver(this), GetPostsParams(quantity: quantity));
  }

  void searchPosts(String searchText) {
    _searchPostUsecase.execute(
      _SearchPostsUseCaseObserver(this),
      SearchPostParams(title: searchText)
    );
  }
  }

  class _GetPostsUseCaseObserver implements Observer<GetPostsResponse> {
    final SearchPresenter homePresenter;
    _GetPostsUseCaseObserver(this.homePresenter);

  @override
  void onComplete() {
    assert(homePresenter.getPostsOnComplete != null);
    homePresenter.getPostsOnComplete!();
  }

  @override
  void onError(e) {
    assert(homePresenter.getPostsOnError != null);
    homePresenter.getPostsOnError!(e);
  }

  @override
  void onNext(GetPostsResponse? response) {
    assert(homePresenter.getPostsOnNext != null);
    homePresenter.getPostsOnNext!(response);
  }

  }

class _SearchPostsUseCaseObserver implements Observer<SearchPostResponse> {
  final SearchPresenter homePresenter;
  _SearchPostsUseCaseObserver(this.homePresenter);

  @override
  void onComplete() {
    assert(homePresenter.searchPostsOnComplete != null);
    homePresenter.searchPostsOnComplete!();
  }

  @override
  void onError(e) {
    assert(homePresenter.searchPostsOnError != null);
    homePresenter.searchPostsOnError!(e);
  }

  @override
  void onNext(SearchPostResponse? response) {
    assert(homePresenter.searchPostsOnNext != null);
    homePresenter.searchPostsOnNext!(response);
  }

}