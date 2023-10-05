import 'package:blogs/providers/BlogHiveProvider.dart';
import 'package:blogs/screens/Components/SubSpaceAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/DownloadedBlogsList.dart';

class DownloadedBlogsListScreen extends StatefulWidget {
  static String rout = "/downloaded_list";
  const DownloadedBlogsListScreen({super.key});

  @override
  State<DownloadedBlogsListScreen> createState() => _DownloadedBlogsListScreenState();
}

class _DownloadedBlogsListScreenState extends State<DownloadedBlogsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubspaceAppBar(context: context, showToDownloads: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DownloadedBlogsList(blogs: Provider.of<BlogHiveProvider>(context).savedBlogs),
      ),
    );
  }
}