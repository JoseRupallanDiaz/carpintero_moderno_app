import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class PostUserUseCase extends UseCase<PostUserResponse, PostUserParams> {
  final PostRepository userRepository;

  PostUserUseCase(this.userRepository);

  @override
  Future<Stream<PostUserResponse?>> buildUseCaseStream(
      PostUserParams? params) async {
    final controller = StreamController<PostUserResponse>();
    try {
      await userRepository.register(params!.user);
      controller.add(PostUserResponse());
      logger.finest("PostUserUseCase successful.");
      controller.close();
    } catch (e) {
      logger.severe("PostUserUseCase unsuccessful.");
      controller.addError(e);
    }
    return controller.stream;
  }
}

class PostUserResponse {}

class PostUserParams {
  final User user;
  PostUserParams({required this.user});
}
