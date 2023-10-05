import 'package:blogs/providers/BlogProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class APIUnavailablePopUp extends StatelessWidget {
  const APIUnavailablePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("API Error"),
      content: const Text("The API is not available. Please try again later."),
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<BlogProvider>(context).refresh();
          },
          child: const Text("Retry"),
        ),
      ],
    );
  }
}