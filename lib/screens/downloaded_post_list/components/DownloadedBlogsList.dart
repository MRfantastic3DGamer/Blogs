import 'package:blogs/Styles/TextStyles.dart';
import 'package:blogs/model/BlogHiveModel.dart';
import 'package:blogs/screens/downloaded_post_list/components/DownloadedBlogTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/BlogProvider.dart';
class DownloadedBlogsList extends StatelessWidget {
  final List<BlogModel> blogs;
  const DownloadedBlogsList({
    required this.blogs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print(blogs);
    return Provider.of<BlogProvider>(context).
      isAPIAvailable
        ? blogs.isEmpty
          ? Center(child: Text("No downloads available", style: TextStyles.blogTitle(fontSize: 20),))
          : ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final post = blogs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: DownloadedBlogTile(post: post),
                );
              },
            )
        : const Center(
    );
  }
}