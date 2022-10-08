import 'dart:io';

import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../services/post_service.dart';

class PostProvider with ChangeNotifier {
  final postService = PostService();

  List<PostResModel> _posts = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<PostResModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void getPosts() async {
    try {
      _isLoading = true;
      notifyListeners();
      _posts = await postService.getPosts();
      print(_posts);
      notifyListeners();
    }catch (e){
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
