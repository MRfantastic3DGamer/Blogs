import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BlogPhoto extends StatelessWidget {
  final String url;
  const BlogPhoto(
    this.url,
    {super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const SizedBox(
        width: double.infinity,
        height: 250,
        child: Center(child: Text("Image not found")),
      ),
    );
  }
}