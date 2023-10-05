
import 'package:blogs/Styles/TextStyles.dart';
import 'package:blogs/Styles/ColorStyles.dart';
import 'package:blogs/model/BlogHiveModel.dart';
import 'package:blogs/providers/BlogHiveProvider.dart';
import 'package:blogs/screens/downloaded_post_list/DownloadedBlogDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Components/DownloadedPhoto.dart';

class DownloadedBlogTile extends StatelessWidget {
  final BlogModel post;

  const DownloadedBlogTile({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<BlogHiveProvider>(context, listen: false).select(post);
        Navigator.pushNamed(context,DownloadedBlogDetailScreen.route);
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
            DownloadedPhoto(post: post),
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