
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BlogHiveProvider extends ChangeNotifier{
  static String boxName = "BlogsBox";
  String path = "";
  var box = Hive.box(boxName);

  Future<void> init() async {
    var path = "${Directory.current.path}/$boxName";
    final collection = await BoxCollection.open(
      "hiveDatabase",
      {boxName},
      path: path,
      // key: HiveCipher(),
    );

    Hive
      ..init(path);
      // ..registerAdapter(PersonAdapter());
    var box = await Hive.openBox('testBox');
  }
}