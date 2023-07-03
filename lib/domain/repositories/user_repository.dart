import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();

  saveUser(User user);

  register(User user);

  Future<User> login(String email, String password);
}
