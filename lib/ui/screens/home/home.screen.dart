import 'package:flutter/material.dart';

import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/repository/news.repository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() {
    final repo = locator<NewsRepository>();
    repo.loadTopHeadlinesForAllCategories().then((result) {
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
    );
  }
}
