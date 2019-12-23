import 'package:flutter/material.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/api/news.api.dart';
import 'package:newsapp/data/models/article.model.dart';

class CategoryProvider extends ChangeNotifier {
  final _api = locator<NewsApi>();
  final String categoryName;

  List<Article> _articles = [];
  int _totalResults = 0;

  bool get canLoadMore {
    return _articles.length < _totalResults;
  }

  List<Article> get articles => _articles;

  CategoryProvider({@required this.categoryName})
      : assert(categoryName != null);

  Future<void> load() async {
    _articles = [];
    await _loadCategory();
    notifyListeners();
  }

  Future<void> loadMore() async {
    final currentPage = (_articles.length / 20).floor();
    await _loadCategory(page: currentPage + 1);
    notifyListeners();
  }

  Future<void> _loadCategory({int page = 1}) async {
    final response = await _api.getTopHeadlinesForCategory(
      categoryName,
      page: page,
    );
    _parseCategoriesResponse(response);
  }

  void _parseCategoriesResponse(Map<String, dynamic> json) {
    final articlesJson = json['articles'] as List<dynamic>;
    List<Article> articles = articlesJson
        .map((articleJson) => Article.fromJson(articleJson))
        .where((article) => article != null)
        .toList();

    _totalResults = json['totalResults'];
    _articles.addAll(articles);
  }
}
