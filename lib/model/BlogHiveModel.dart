import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'BlogHiveModel.g.dart';

@HiveType(typeId: 0)
class BlogModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  Uint8List imageData;
  @HiveField(2)
  final String title;
  BlogModel(this.id, this.imageData, this.title);
}