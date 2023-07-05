import 'dart:io';

import '../entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts(int quantity);

  Future<String> newPost(Post post, String token, File image);

  Future<List<Post>> searchWithText(String title);
}
