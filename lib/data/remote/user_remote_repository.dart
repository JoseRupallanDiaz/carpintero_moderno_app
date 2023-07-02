import 'package:el_carpintero_moderno_app/domain/entities/user.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class UserRemoteRepository implements UserRepository {
  //API Variables
  final String mainURI = "carpintero-moderno-api-typescript.azurewebsites.net";
  final String registerUri = "/singup";
  Logger logger = Logger("UserRemoteRepository");

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<String> login(User user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> register(User user) async {
    try {
      var url = Uri.https(mainURI, registerUri);
      var response = await http.post(
        url,
        body: {
          "userName": user.username,
          "email": user.email,
          "password": user.password,
        },
      );
      if (response.statusCode == 201) {
        logger.finest("Register successful.");
        return true;
      } else {
        logger.warning(
            "Register unsuccessful. Status code ${response.statusCode}");
        return false;
      }
    } catch (e) {
      logger.severe("Something went wrong. $e");
      return false;
    }
  }
}
