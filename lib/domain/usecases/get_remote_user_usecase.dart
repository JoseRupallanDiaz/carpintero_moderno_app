import 'dart:async';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../entities/user.dart';

class GetRemoteUserUseCase
    extends UseCase<GetRemoteUserUseCaseResponse, GetRemoteUserUseCaseParams> {
  final PostRepository userRepository;

  GetRemoteUserUseCase(this.userRepository);
  @override
  Future<Stream<GetRemoteUserUseCaseResponse?>> buildUseCaseStream(
      GetRemoteUserUseCaseParams? params) async {
    final controller = StreamController<GetRemoteUserUseCaseResponse>();
    try {
      final User user =
          await userRepository.login(params!.email, params.password);
      controller.add(GetRemoteUserUseCaseResponse(user: user));
      logger.finest("GetTokenUseCase successful.");
      controller.close();
    } catch (e) {
      logger.severe("GetTokenUseCase unsuccessful.");
      controller.addError(e);
    }
    return controller.stream;
  }
}

class GetRemoteUserUseCaseResponse {
  User user;
  GetRemoteUserUseCaseResponse({required this.user});
}

class GetRemoteUserUseCaseParams {
  String email;
  String password;
  GetRemoteUserUseCaseParams({required this.email, required this.password});
}
