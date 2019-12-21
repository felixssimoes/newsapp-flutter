import 'package:flutter/material.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/models/category.model.dart';
import 'package:newsapp/data/repository/news.repository.dart';

class NewsProvider extends ChangeNotifier {
  final _repo = locator<NewsRepository>();
  var _categoriesMap = Map<String, Category>();
  var _categories = List<Category>();

  List<Category> get categories => _categories;

  Category getCategoryWithName(String category) {
    return _categoriesMap[category];
  }

  Future<void> loadAllCategories() async {
    _categories = await _repo.loadTopHeadlinesForAllCategories();
    _categoriesMap = _categories.fold({}, (map, category) {
      map[category.name] = category;
      return map;
    });
    notifyListeners();
  }
}
