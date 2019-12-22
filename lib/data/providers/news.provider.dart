import 'package:flutter/material.dart';
import 'package:newsapp/data/providers/category.provider.dart';

const kNewsCategories = [
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
  'technology',
];

class NewsProvider extends ChangeNotifier {
  var _categoriesMap = Map<String, CategoryProvider>();
  var _categoriesProviders = List<CategoryProvider>();

  List<CategoryProvider> get categoriesProviders => _categoriesProviders;

  CategoryProvider getCategoryWithName(String category) {
    return _categoriesMap[category];
  }

  Future<void> loadAllCategories() async {
    _categoriesProviders = kNewsCategories.map((category) {
      return CategoryProvider(categoryName: category)..load();
    }).toList();

    _categoriesMap = _categoriesProviders.fold({}, (map, provider) {
      map[provider.categoryName] = provider;
      return map;
    });

    notifyListeners();
  }
}
