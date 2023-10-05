import 'package:blogs/Styles/TextStyles.dart';
import 'package:blogs/Styles/ColorStyles.dart';
import 'package:blogs/model/BlogPost.dart';
import 'package:blogs/screens/Components/BlogPhoto.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/BlogProvider.dart';
import '../../blog_detail/BlogDetail.dart';

class BlogTile extends StatelessWidget {
  final BlogPost post;

  const BlogTile({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<BlogProvider>(context, listen: false).selectBlog(post);
        Navigator.pushNamed(context,BlogDetail.route);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: ColorStyles.textColor,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Hero(
              tag: post.id,
              child: BlogPhoto(post.imageUrl)
            ),
            Container(
              color: ColorStyles.tileBG,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  post.title,
                  style: TextStyles.blogTitle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: ColorStyles.textColor
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}