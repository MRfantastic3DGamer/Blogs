import 'package:blogs/Styles/ColorStyles.dart';
import 'package:blogs/screens/blog_detail/BlogDetail.dart';
import 'package:blogs/screens/blogs_list/BlogsListScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:blogs/providers/BlogProvider.dart';

void main() async {
  // await Hive.initFlutter();
  // Hive.registerAdapter(BlogModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BlogProvider() ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, background: ColorStyles.background),
          useMaterial3: true,
        ),
        home: const BlogsListScreen(),
        routes: {
          BlogDetail.route: (_) => const BlogDetail()
        },
      ),
    );
  }
}