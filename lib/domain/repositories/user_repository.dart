import '../entities/user.dart';

abstract class UserRepository {
  Future<User> getUser();

  Future<bool> register(User user);

  Future<String> login(User user);
}
