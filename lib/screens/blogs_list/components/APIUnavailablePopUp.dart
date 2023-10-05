import 'package:blogs/Styles/TextStyles.dart';
import 'package:blogs/providers/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class APIUnavailablePopUp extends StatelessWidget {
  const APIUnavailablePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "API Error",
        style: TextStyles.blogTitle(fontSize: 25),
        ),
      content: Text(
        "The API is not available. Please try again later.",
        style: TextStyles.blogTitle(fontSize: 15),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<BlogProvider>(context, listen: false).refresh();
          },
          child: const Text("Retry"),
        ),
      ],
    );
  }
}