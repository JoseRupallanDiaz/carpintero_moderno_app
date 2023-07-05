import 'package:el_carpintero_moderno_app/domain/usecases/search_post_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:el_carpintero_moderno_app/app/pages/posts/posts_presenter.dart';
import 'package:el_carpintero_moderno_app/app/widgets/post_widget.dart';
import 'package:el_carpintero_moderno_app/data/mock/post_mock_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_posts_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import '../../../data/local/user_local_repository.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/repositories/post_repository.dart';
import 'Search_presenter.dart';


class SearchController extends Controller {
  final SearchPresenter searchPresenter;
  List<Post> posts;

  TextEditingController searchText = TextEditingController();

  SearchController(PostRepository postRepository)
      : searchPresenter = SearchPresenter(postRepository),
        posts = [];


   void SearchWithText(SearchText){

   }

  @override
  void initListeners() {
     searchPresenter.getPostsOnComplete =() {};
     searchPresenter.getPostsOnError = () {};
     searchPresenter.getPostsOnNext = () {};
    searchPresenter.searchPostsOnComplete = () {};
    searchPresenter.searchPostsOnError = (e) {refreshUI();};
    searchPresenter.searchPostsOnNext = searchPostsOnNext;
  }

  void searchPostsOnNext(SearchPostResponse response) {
    posts = response.posts;
    refreshUI();
  }

  void search(){
     print(searchText.text);
     searchPresenter.searchPosts(searchText.text);
  }
}