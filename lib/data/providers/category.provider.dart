import 'package:flutter/material.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/models/category.model.dart';
import 'package:newsapp/data/repository/news.repository.dart';

class CategoryProvider extends ChangeNotifier {
  final _repo = locator<NewsRepository>();
  final String categoryName;
  Category _category;

  bool get canLoadMore {
    if (_category == null) return false;
    return _category.articles.length < _category.totalResults;
  }

  List<Article> get articles => _category?.articles ?? [];

  CategoryProvider({@required this.categoryName})
      : assert(categoryName != null);

  Future<void> load() async {
    _category = await _repo.loadTopHeadlinesForCategory(categoryName);
    notifyListeners();
  }

  Future<void> loadMore() async {}
}
