
import 'package:blogs/providers/BlogHiveProvider.dart';
import 'package:blogs/screens/downloaded_post_list/DownloadedBlogsListScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Styles/ColorStyles.dart';
import '../../Styles/TextStyles.dart';

AppBar SubspaceAppBar ({
  required context,
  showToDownloads = true,
}){
    return AppBar(
      title: Text("SubSpace", style: TextStyles.subSpace(),),
      backgroundColor: ColorStyles.background,
      actions: [
        if(showToDownloads)
          IconButton(
            color: ColorStyles.textColor,
            onPressed: () {
              Provider.of<BlogHiveProvider>(context, listen: false).initHive();
              Navigator.pushNamed(context,DownloadedBlogsListScreen.rout);
            },
            icon: const Icon(
              Icons.download_for_offline_rounded,
              color: ColorStyles.textColor,
              size: 45,
            ),
          )
      ],
    );
  }