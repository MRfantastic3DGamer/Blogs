
import 'package:blogs/providers/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/BlogsList.dart';
import '../Components/SubSpaceAppBar.dart';

class BlogsListScreen extends StatefulWidget {
  const BlogsListScreen({super.key});

  @override
  State<BlogsListScreen> createState() => _BlogsListScreenState();
}

class _BlogsListScreenState extends State<BlogsListScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<BlogProvider>(context).fetchBlogs();
    return Scaffold(
      appBar: SubspaceAppBar(context: context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListWidget(blogs: Provider.of<BlogProvider>(context).blogs),
      ),
    );
  }
}
