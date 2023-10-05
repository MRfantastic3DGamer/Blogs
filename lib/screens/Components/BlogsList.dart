import 'package:blogs/model/BlogPost.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/BlogProvider.dart';
import '../blogs_list/components/APIUnavailablePopUp.dart';
import '../blogs_list/components/BlogTile.dart';

class ListWidget extends StatelessWidget {
  final List<BlogPost> blogs;
  const ListWidget({
    required this.blogs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Provider.of<BlogProvider>(context).
      isAPIAvailable
        ? blogs.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                final post = blogs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: BlogTile(post: post),
                );
              },
            )
        : const Center(
          child: APIUnavailablePopUp(),
    );
  }
}