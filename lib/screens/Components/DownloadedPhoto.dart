import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../model/BlogHiveModel.dart';

class DownloadedPhoto extends StatelessWidget {
  const DownloadedPhoto({
    super.key,
    required this.post,
  });

  final BlogModel post;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: post.id,
      child: Image.memory(Uint8List.fromList(post.imageData,),
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
      ),
    );
  }
}