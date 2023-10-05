import 'package:blogs/Styles/ColorStyles.dart';
import 'package:blogs/model/BlogPost.dart';
import 'package:blogs/providers/BlogHiveProvider.dart';
import 'package:blogs/providers/BlogProvider.dart';
import 'package:blogs/screens/Components/BlogPhoto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Styles/TextStyles.dart';

class BlogDetail extends StatelessWidget {

  static String route = "/blog_detail";

  const BlogDetail(
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    BlogPost post = Provider.of<BlogProvider>(context).selectedPost;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 70, 7, 10),
              child: Text(post.title, style: TextStyles.blogTitle(),maxLines: 5),
            ),
            Hero(
              tag: post.id,
              child: BlogPhoto(post.imageUrl)
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: ColorStyles.textColor,
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("downloading"), duration: Duration(milliseconds: 500),));
          await Provider.of<BlogHiveProvider>(context, listen: false).addPost(post);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("downloaded"), duration: Duration(milliseconds: 500),));
        },
        child: const Icon(Icons.download_rounded)),
    );
  }
}