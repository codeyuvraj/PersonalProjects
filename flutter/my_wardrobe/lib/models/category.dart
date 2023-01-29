import 'package:flutter/material.dart';

class Category {
  int id = 0;
  String name = "categoryName";
  List<int>? itemIds;

  Category({required this.id, required this.name, this.itemIds});
}

class GenderCategory extends Category {
  final List<int> categoryIds;
  GenderCategory(
      {required super.id, required super.name, required this.categoryIds});
}
