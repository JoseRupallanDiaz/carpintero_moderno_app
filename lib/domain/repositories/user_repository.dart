import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();

  removeUser();

  saveUser(User user);

  register(User user);

  Future<User> login(String email, String password);
}
