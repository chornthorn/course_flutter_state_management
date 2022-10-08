import 'dart:convert';

import 'package:flutter_state_mangement/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostService {
  final String _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostResModel>> getPosts() async {
    try {
      Response response = await http.get(Uri.parse(_url));

      if (response.statusCode != 200) {
        throw Exception('error getting posts');
      }

      final posts = jsonDecode(response.body) as List;
      return posts.map((post) => PostResModel.fromJson(post)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PostResModel> getPostDetail(int postId) async {
    try {
      Response response = await http.get(Uri.parse('$_url/$postId'));

      if (response.statusCode != 200) {
        throw Exception('error getting posts');
      }

      final posts = jsonDecode(response.body);
      return PostResModel.fromJson(posts);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
