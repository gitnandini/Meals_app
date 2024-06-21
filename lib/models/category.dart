import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  //default values for named arguments in case no vales provided
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
