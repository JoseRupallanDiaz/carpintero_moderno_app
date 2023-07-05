import 'dart:io';

import 'package:el_carpintero_moderno_app/data/local/user_local_repository.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_local_user_usecase.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/new_post_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/repositories/post_repository.dart';

class NewPostPresenter extends Presenter {
  Function? newPostOnComplete;
  Function? newPostOnError;
  Function? newPostOnNext;

  Function? getUserOnComplete;
  Function? getUserOnError;
  Function? getUserOnNext;

  final NewPostUseCase _newPostUseCase;
  final GetLocalUserUseCase _getLocalUserUseCase;

  NewPostPresenter(PostRepository postRepository, UserRepository userRepository)
      : _newPostUseCase = NewPostUseCase(postRepository),
        _getLocalUserUseCase = GetLocalUserUseCase(userRepository);

  @override
  void dispose() {
    _newPostUseCase.dispose();
    _getLocalUserUseCase.dispose();
  }

  void newPost(Post post, String token, BuildContext context, File image) {
    _newPostUseCase.execute(
        _NewPostObserver(this),
        NewPostParams(
          post: post,
          token: token,
          context: context,
          image: image,
        ));
  }

  void getLocalUser() {
    _getLocalUserUseCase.execute(_GetLocalUserObserver(this));
  }
}

class _NewPostObserver extends Observer<NewPostResponse> {
  NewPostPresenter newPostPresenter;

  _NewPostObserver(this.newPostPresenter);

  @override
  void onComplete() {
    assert(newPostPresenter.newPostOnComplete != null);
    newPostPresenter.newPostOnComplete!();
  }

  @override
  void onError(e) {
    assert(newPostPresenter.newPostOnError != null);
    newPostPresenter.newPostOnError!(e);
  }

  @override
  void onNext(NewPostResponse? response) {
    assert(newPostPresenter.newPostOnNext != null);
    newPostPresenter.newPostOnNext!(response);
  }
}

class _GetLocalUserObserver extends Observer<GetLocalUserUseCaseResponse> {
  NewPostPresenter newPostPresenter;

  _GetLocalUserObserver(this.newPostPresenter);

  @override
  void onComplete() {
    assert(newPostPresenter.getUserOnComplete != null);
    newPostPresenter.getUserOnComplete!();
  }

  @override
  void onError(e) {
    assert(newPostPresenter.getUserOnError != null);
    newPostPresenter.getUserOnError!(e);
  }

  @override
  void onNext(GetLocalUserUseCaseResponse? response) {
    assert(newPostPresenter.getUserOnNext != null);
    newPostPresenter.getUserOnNext!(response);
  }
}
