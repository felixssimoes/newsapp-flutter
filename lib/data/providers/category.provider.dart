import 'package:flutter/material.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/models/category.model.dart';
import 'package:newsapp/data/repository/news.repository.dart';

class CategoryProvider extends ChangeNotifier {
  final _repo = locator<NewsRepository>();
  final String categoryName;

  Category _category;
  List<Article> _articles = [];

  bool get canLoadMore {
    if (_category == null) return false;
    return _articles.length < _category.totalResults;
  }

  List<Article> get articles => _articles;

  CategoryProvider({@required this.categoryName})
      : assert(categoryName != null);

  Future<void> load() async {
    _category = await _repo.loadTopHeadlinesForCategory(categoryName);
    _articles = _category.articles;
    notifyListeners();
  }

  Future<void> loadMore() async {
    final currentPage = (_articles.length / 20).floor();
    _category = await _repo.loadTopHeadlinesForCategory(
      categoryName,
      page: currentPage + 1,
    );
    _articles.addAll(_category.articles);
    notifyListeners();
  }
}
