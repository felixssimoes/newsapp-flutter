import 'package:flutter/material.dart';

import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/models/category.model.dart';
import 'package:newsapp/data/repository/news.repository.dart';
import 'package:newsapp/ui/widgets/home/category_group.dart';

class HomeScreen extends StatelessWidget {
  final _repo = locator<NewsRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder(
        future: _repo.loadTopHeadlinesForAllCategories(),
        builder: (_, AsyncSnapshot<List<Category>> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView(
            children: snapshot.data
                .map((category) => CategoryGroup(category: category))
                .toList(),
          );
        },
      ),
    );
  }
}
