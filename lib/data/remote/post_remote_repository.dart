import 'dart:convert';

import 'package:el_carpintero_moderno_app/domain/entities/post.dart';
import 'package:el_carpintero_moderno_app/domain/repositories/post_repository.dart';
import 'package:http/http.dart' as http;

import '../../domain/constants.dart';

class PostRemoteRepository extends PostRepository {
  @override
  Future<List<Post>> getPosts(int quantity) async {
    try {
      List<Post> posts = [];
      var url = Uri.https(Constants.mainURI, Constants.getPostsListEndpoint);
      var response = await http.get(url);
      List<dynamic> jsonList = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var post in jsonList) {
          posts.add(Post.fromJson(post));
        }
        return posts;
      } else {
        throw ("${response.statusCode} ${jsonDecode(response.body)["msg"]}");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> newPost(Post post, String token) {
    // TODO: implement newPost
    throw UnimplementedError();
  }
  
  @override
  Future<List<Post>> searchWithText(String title) {
    // TODO: implement searchWithText
    throw UnimplementedError();
  }
}
