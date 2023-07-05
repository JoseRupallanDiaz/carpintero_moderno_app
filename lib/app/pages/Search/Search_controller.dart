import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:el_carpintero_moderno_app/app/pages/posts/posts_presenter.dart';
import 'package:el_carpintero_moderno_app/app/widgets/post_widget.dart';
import 'package:el_carpintero_moderno_app/data/mock/post_mock_repository.dart';
import 'package:el_carpintero_moderno_app/domain/usecases/get_posts_usecase.dart';
import 'package:flutter/material.dart';
import '../../../data/local/user_local_repository.dart';
import '../../../domain/entities/post.dart';
import 'Search_presenter.dart';


class SearchController extends Controller {
  final SearchPresenter searchPresenter;
  List<Post> posts;

  TextEditingController searchText = TextEditingController();

  SearchController(PostMockRepository postMockRepository)
      : searchPresenter = SearchPresenter(postMockRepository),
        posts = [];


   void SearchWithText(SearchText){

   }

  @override
  void initListeners() {
    searchPresenter.searchPostsOnComplete = () {};
    searchPresenter.searchPostsOnError = (e) {};
    searchPresenter.searchPostsOnNext = searchPostsOnNext;
  }

  void searchPostsOnNext(GetPostsResponse response) {
    posts = response.posts;
    refreshUI();
  }

  @override
  void onInitState() {
    super.onInitState();
    searchPresenter.getPosts(10);
  }

  void search(){
     print(searchText.text);
     searchPresenter.searchPosts(searchText.text);
  }
}