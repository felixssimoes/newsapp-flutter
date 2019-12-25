import 'package:flutter/foundation.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/api/news.api.dart';
import 'package:newsapp/data/models/article.model.dart';

abstract class ArticlesResultProvider {
  final _api = locator<NewsApi>();
  List<Article> _articles = [];
  int _totalResults = 0;

  bool get canLoadMore {
    return _articles.length < _totalResults;
  }

  NewsApi get api => _api;
  List<Article> get articles => _articles;

  int get currentPage => (_articles.length / 20).floor();

  void parseResponse(Map<String, dynamic> json) {
    final status = json['status'];
    if (status == null || status != 'ok') {
      // something wrong happened
      return;
    }
    final articlesJson = json['articles'] as List<dynamic>;
    List<Article> articles = articlesJson
        .map((articleJson) => Article.fromJson(articleJson))
        .where((article) => article != null)
        .toList();

    _totalResults = json['totalResults'];
    _articles.addAll(articles);
  }

  void clearResults({@required bool articles, totals: false}) {
    if (articles) _articles = [];
    if (totals) _totalResults = 0;
  }
}
