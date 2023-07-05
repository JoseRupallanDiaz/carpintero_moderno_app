import 'dart:convert';
import 'dart:io';

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
  Future<String> newPost(Post post, String token, File image) async {
    try {
      var url = Uri.https(Constants.mainURI, Constants.newPostEndpoint);
      var request = http.MultipartRequest("POST", url);
      request.fields['title'] = post.title;
      request.fields['materials'] = post.materials.toString();
      request.fields['tools'] = post.tools.toString();
      request.fields['difficulty'] = post.difficulty.toString();
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
      var streamResponse = await request.send();
      var response = await http.Response.fromStream(streamResponse);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw (response.body);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<List<Post>> searchPosts(String title) {
    // TODO: implement searchPosts
    throw UnimplementedError();
  }
  
  @override
  Future<List<Post>> searchWithText(String title) async {
    print(title);
    List<Post> posts = [];
    try {
      var url = Uri.https(
          Constants.mainURI,
          Constants.searchPost,
          {"title": title});
      var response = await http.get(url);
      List<dynamic> jsonList = jsonDecode(response.body);
      for (var post in jsonList) {
        posts.add(Post.fromJson(post));
      }
    } catch (e) {

      print(e);
    }
    return posts;
  }
}
