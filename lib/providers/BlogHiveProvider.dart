import 'dart:typed_data';

import 'package:blogs/model/BlogPost.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../model/BlogHiveModel.dart';

class BlogHiveProvider extends ChangeNotifier{
  static String postsBoxName = "postsBox";
  bool initialized = false;
  late Box<BlogModel> box;
  List<BlogModel> savedBlogs = [];

  BlogModel selectedPost = BlogModel("",Uint8List(0),"");

  Future<void> initHive() async {
    box = await Hive.openBox<BlogModel>(postsBoxName);
    savedBlogs.clear();
    for (var element in box.values) {
      savedBlogs.add(element);
    }
    initialized = true;
  }

  Future<void> addPost(BlogPost post) async {
    if(!initialized) await initHive();
    if(box.containsKey(post.id)) return;
    var image = await fetchImageFromUrl(post.imageUrl);
    box.put(post.id, BlogModel(post.id, image, post.title));
    notifyListeners();
  }

  Future<void> removePost(String key) async {
    if(!initialized) await initHive();
    await box.delete(key);
    savedBlogs.removeWhere((it) => it.id == key);
    notifyListeners();
  }

  Future<Uint8List> fetchImageFromUrl(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to fetch image');
    }
  }

  void select(BlogModel post){
    selectedPost = post;
    notifyListeners();
  }

}