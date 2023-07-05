import 'dart:async';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RemoveLocalUserUseCase
    extends UseCase<RemoveLocalUserResponse, RemoveLocalUserParams> {
  final PostRepository userRepository;

  RemoveLocalUserUseCase(this.userRepository);
  @override
  Future<Stream<RemoveLocalUserResponse?>> buildUseCaseStream(
      RemoveLocalUserParams? params) async {
    final controller = StreamController<RemoveLocalUserResponse>();
    try {
      await userRepository.removeUser();
      controller.add(RemoveLocalUserResponse(context: params!.context));
      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class RemoveLocalUserResponse {
  BuildContext context;
  RemoveLocalUserResponse({required this.context});
}

class RemoveLocalUserParams {
  BuildContext context;
  RemoveLocalUserParams({required this.context});
}
