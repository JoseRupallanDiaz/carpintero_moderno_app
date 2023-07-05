import 'dart:async';

import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../entities/post.dart';

class SearchPostUsecase extends UseCase<SearchPostResponse,SearchPostParams>{

  PostRepository postRepository;

  SearchPostUsecase(this.postRepository);

  @override
  Future<Stream<SearchPostResponse?>> buildUseCaseStream(SearchPostParams? params) async {
    final controller = StreamController<SearchPostResponse>();
    try {
    final List<Post> posts = await postRepository.searchWithText(params!.title);
    controller.add(SearchPostResponse(posts: posts));
    logger.finest('GetPostsUseCase successful.');
    controller.close();
    } catch (e) {
    logger.severe('GetPostsUseCase unsuccessful.');
    controller.addError(e);
    }
    return controller.stream;
    }
  }


class SearchPostResponse {
  List<Post> posts;
  SearchPostResponse({required this.posts});
}

class SearchPostParams{
  String title;
  SearchPostParams({required this.title});
}