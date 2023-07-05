import '../entities/user.dart';

abstract class PostRepository {
  Future<User> getUser();

  removeUser();

  saveUser(User user);

  register(User user);

  Future<User> login(String email, String password);
}
