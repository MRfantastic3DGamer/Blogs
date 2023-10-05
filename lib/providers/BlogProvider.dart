import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/BlogPost.dart';

class BlogProvider with ChangeNotifier {
  List<BlogPost> blogs = [];
  bool apiFetched = false;
  bool isAPIAvailable = true;
  BlogPost selectedPost = BlogPost(id: "", title: "name", imageUrl: "");

  void fetchBlogs() async {
    if(apiFetched) return;

    apiFetched = true;
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> blogData = responseData['blogs'];

        blogs = blogData.map((item) {
          return BlogPost(
            id: item['id'],
            imageUrl: item['image_url'],
            title: item['title'],
          );
        }).toList();
        isAPIAvailable = true;
        notifyListeners();
      } else {
        isAPIAvailable = false;
        notifyListeners();
      }
    } catch (e) {
        isAPIAvailable = false;
        notifyListeners();
      print('Error: $e');
    }
  }

  void selectBlog(BlogPost post){
    selectedPost = post;
    notifyListeners();
  }

  void refresh(){
    isAPIAvailable = true;
    blogs = [];
    notifyListeners();
    fetchBlogs();
  }
}