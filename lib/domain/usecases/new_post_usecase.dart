import 'dart:async';
import 'dart:io';
import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../entities/post.dart';

class NewPostUseCase extends UseCase<NewPostResponse, NewPostParams> {
  final PostRepository postRepository;
  NewPostUseCase(this.postRepository);

  @override
  Future<Stream<NewPostResponse?>> buildUseCaseStream(
      NewPostParams? params) async {
    final controller = StreamController<NewPostResponse>();
    try {
      String id = await postRepository.newPost(
          params!.post, params.token, params.image);
      controller.add(NewPostResponse(id: id, context: params.context));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class NewPostResponse {
  String id;
  BuildContext context;
  NewPostResponse({required this.id, required this.context});
}

class NewPostParams {
  Post post;
  File image;
  String token;
  BuildContext context;
  NewPostParams(
      {required this.post,
      required this.token,
      required this.context,
      required this.image});
}
