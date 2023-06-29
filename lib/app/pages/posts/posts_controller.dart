import 'package:el_carpintero_moderno_app/app/pages/posts/posts_presenter.dart';
import 'package:el_carpintero_moderno_app/app/widgets/post_widget.dart';
import 'package:el_carpintero_moderno_app/data/mock/post_mock_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_posts_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/post.dart';

class PostController extends Controller {
  final PostPresenter postPresenter;
  List<Post> posts;

  PostController(PostMockRepository postMockRepository)
      : postPresenter = PostPresenter(postMockRepository),
        posts = [];

  @override
  void initListeners() {
    postPresenter.getPostsOnComplete = () {};
    postPresenter.getPostsOnError = (e) {};
    postPresenter.getPostsOnNext = getPostsOnNext;
  }

  void getPostsOnNext(GetPostsResponse response) {
    posts = response.posts;
    refreshUI();
  }

  @override
  void onInitState() {
    super.onInitState();
    postPresenter.getPosts(10);
  }
}
