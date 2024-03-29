import 'dart:convert';
import 'package:el_carpintero_moderno_app/domain/entities/user.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:http/http.dart' as http;
import '../../domain/constants.dart';

class UserRemoteRepository implements UserRepository {
  @override
  Future<User> getUser() async {
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      var url = Uri.https(Constants.mainURI, Constants.loginEndpoint);
      var response = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        User user = User.fromJson(json["user"], json["token"]);
        return user;
      } else {
        throw ("${response.statusCode} ${jsonDecode(response.body)["msg"]}");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  register(User user) async {
    try {
      var url = Uri.https(Constants.mainURI, Constants.registerEndpoint);
      var response = await http.post(
        url,
        body: {
          "userName": user.username,
          "email": user.email,
          "password": user.password,
        },
      );
      if (response.statusCode == 201) {
      } else {
        throw ("${response.statusCode} ${jsonDecode(response.body)["msg"]}");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  removeUser() {
    // TODO: implement removeUser
    throw UnimplementedError();
  }
}
