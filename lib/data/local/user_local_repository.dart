import 'package:el_carpintero_moderno_app/domain/entities/user.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/user_repository.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import '../../domain/constants.dart';

class UserLocalRepository implements UserRepository {
  final box = GetStorage();
  var logger = Logger();

  @override
  Future<User> getUser() async {
    try {
      if (box.hasData(Constants.userInfo)) {
        Map<String, dynamic> json = await box.read(Constants.userInfo);
        User user = User.fromJson(json["user"], json["token"]);
        return user;
      } else {
        throw ("Local User not found.");
      }
    } catch (e) {
      logger.e("Unable to read Local User. $e");
      rethrow;
    }
  }

  @override
  Future<User> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  void saveUser(User user) async {
    try {
      box.write(Constants.userInfo, user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  removeUser() {
    try {
      box.remove(Constants.userInfo);
    } catch (e) {
      rethrow;
    }
  }
}
