
import 'package:blogs/model/BlogHiveModel.dart';
import 'package:blogs/screens/Components/DownloadedPhoto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Styles/ColorStyles.dart';
import '../../Styles/TextStyles.dart';
import '../../providers/BlogHiveProvider.dart';

class DownloadedBlogDetailScreen extends StatelessWidget {
  static String route = "/downloaded_blog_detail";

  const DownloadedBlogDetailScreen(
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    BlogModel post = Provider.of<BlogHiveProvider>(context).selectedPost;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 70, 7, 10),
              child: Text(post.title, style: TextStyles.blogTitle(),maxLines: 5),
            ),
            DownloadedPhoto(post: post),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        backgroundColor: ColorStyles.textColor,
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("deleting"), duration: Duration(milliseconds: 500),));
          Provider.of<BlogHiveProvider>(context, listen: false).removePost(post.id);
          Navigator.pop(context);
        },
        child: const Icon(Icons.delete_forever_rounded)),
    );
  }
}