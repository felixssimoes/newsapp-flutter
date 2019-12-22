import 'package:flutter/material.dart';
import 'package:newsapp/data/models/category.model.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({
    Key key,
    @required this.category,
  })  : assert(category != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
    );
  }
}
