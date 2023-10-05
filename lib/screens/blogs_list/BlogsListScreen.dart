import 'package:blogs/Styles/ColorStyles.dart';
import 'package:blogs/providers/BlogProvider.dart';
import 'package:blogs/screens/blogs_list/components/APIUnavailablePopUp.dart';
import 'package:blogs/screens/blogs_list/components/BlogTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:blogs/Styles/TextStyles.dart';

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
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/svgs/subspace logo.svg",
              width: 100,
              height: 100,
            ),
            Text("ubSpace", style: TextStyles.subSpace(),)
          ],
        ),
        backgroundColor: ColorStyles.background,
        actions: [
          CircleAvatar(
            backgroundColor: ColorStyles.textColor,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dehaze_rounded),
              color: ColorStyles.background,
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListWidget(),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({
    super.key,
  });

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    final blogs = Provider.of<BlogProvider>(context).blogs;

    return Scaffold(
      body: Provider.of<BlogProvider>(context).
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
        )
    );
  }
}