import 'package:flutter/foundation.dart';
import 'package:newsapp/data/models/article.model.dart';

class Category {
  final String name;
  final int totalResults;
  final List<Article> articles;

  Category._({
    @required this.name,
    @required this.totalResults,
    @required this.articles,
  });

  factory Category.fromJson(String name, Map<String, dynamic> json) {
    try {
      final articlesJson = json['articles'] as List<dynamic>;
      List<Article> articles = articlesJson
          .map((articleJson) => Article.fromJson(articleJson))
          .toList();

      return Category._(
        name: name,
        totalResults: json['totalResults'],
        articles: articles,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  String toString() {
    return 'Category $name (${articles.length}/$totalResults)';
  }
}
