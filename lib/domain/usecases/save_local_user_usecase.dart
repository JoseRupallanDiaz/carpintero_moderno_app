import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class SaveLocalUserUseCase
    extends UseCase<SaveLocalUserResponse, SaveLocalUserParams> {
  final PostRepository userRepository;

  SaveLocalUserUseCase(this.userRepository);

  @override
  Future<Stream<SaveLocalUserResponse>> buildUseCaseStream(
      SaveLocalUserParams? params) async {
    final controller = StreamController<SaveLocalUserResponse>();
    try {
      await userRepository.saveUser(params!.user);
      controller.add(SaveLocalUserResponse(success: true));
      logger.finest("PostUserUseCase successful.");
      controller.close();
    } catch (e) {
      logger.severe("PostUserUseCase unsuccessful.");
      controller.addError(e);
    }
    return controller.stream;
  }
}

class SaveLocalUserResponse {
  final bool success;
  SaveLocalUserResponse({required this.success});
}

class SaveLocalUserParams {
  final User user;
  SaveLocalUserParams({required this.user});
}
