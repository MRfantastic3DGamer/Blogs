import 'package:blogs/model/BlogPost.dart';
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
    );
  }
}