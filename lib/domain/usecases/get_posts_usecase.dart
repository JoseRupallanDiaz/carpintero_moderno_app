import 'dart:async';

import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../entities/post.dart';

class GetPostsUseCase extends UseCase<GetPostsResponse, GetPostsParams> {
  final PostRepository postRepository;

  GetPostsUseCase(this.postRepository);

  @override
  Future<Stream<GetPostsResponse?>> buildUseCaseStream(
      GetPostsParams? params) async {
    final controller = StreamController<GetPostsResponse>();
    try {
      final List<Post> posts = await postRepository.getPosts(params!.quantity);
      controller.add(GetPostsResponse(posts: posts));
      logger.finest('GetPostsUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetPostsUseCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetPostsResponse {
  final List<Post> posts;
  GetPostsResponse({required this.posts});
}

class GetPostsParams {
  final int quantity;
  GetPostsParams({required this.quantity});
}
