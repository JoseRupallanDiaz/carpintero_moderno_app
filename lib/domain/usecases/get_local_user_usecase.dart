import 'dart:async';

import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../entities/user.dart';

class GetLocalUserUseCase extends UseCase<GetLocalUserUseCaseResponse, void> {
  final PostRepository userRepository;

  GetLocalUserUseCase(this.userRepository);
  @override
  Future<Stream<GetLocalUserUseCaseResponse?>> buildUseCaseStream(
      void params) async {
    final controller = StreamController<GetLocalUserUseCaseResponse>();
    try {
      final User user = await userRepository.getUser();
      controller.add(GetLocalUserUseCaseResponse(user: user));
      logger.finest("GetTokenUseCase successful.");
      controller.close();
    } catch (e) {
      logger.severe("GetTokenUseCase unsuccessful.");
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetLocalUserUseCaseResponse {
  User? user;
  GetLocalUserUseCaseResponse({this.user});
}
