import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts(int quantity);

  Future<bool> newPost(Post post, String token);
}
