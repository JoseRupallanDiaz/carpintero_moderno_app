import 'dart:io';

import 'package:el_carpintero_moderno_app/domain/usecases/new_post_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/repositories/post_repository.dart';

class NewPostPresenter extends Presenter {
  Function? newPostOnComplete;
  Function? newPostOnError;
  Function? newPostOnNext;

  final NewPostUseCase _newPostUseCase;

  NewPostPresenter(PostRepository postRepository)
      : _newPostUseCase = NewPostUseCase(postRepository);

  @override
  void dispose() {
    _newPostUseCase.dispose();
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
