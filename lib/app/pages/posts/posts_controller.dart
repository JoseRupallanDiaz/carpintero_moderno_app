import 'package:el_carpintero_moderno_app/app/pages/posts/posts_presenter.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_posts_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/post.dart';

class PostController extends Controller {
  final PostPresenter postPresenter;
  List<Post> posts;
  bool isLoading = true;

  PostController(PostRepository postRepository)
      : postPresenter = PostPresenter(postRepository),
        posts = [];

  @override
  void initListeners() {
    postPresenter.getPostsOnComplete = () {};
    postPresenter.getPostsOnError = (e) {};
    postPresenter.getPostsOnNext = getPostsOnNext;
  }

  void getPostsOnNext(GetPostsResponse response) {
    posts = response.posts;
    isLoading = false;
    refreshUI();
  }

  @override
  void onInitState() {
    super.onInitState();
    postPresenter.getPosts(10);
  }
}
