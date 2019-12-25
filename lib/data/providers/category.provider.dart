import 'package:flutter/material.dart';
import 'package:newsapp/data/providers/shared/articles_result.provider.dart';

class CategoryProvider extends ArticlesResultProvider with ChangeNotifier {
  final String categoryName;

  CategoryProvider({@required this.categoryName})
      : assert(categoryName != null);

  Future<void> load() async {
    clearResults(articles: true);
    await _loadCategory();
    notifyListeners();
  }

  Future<void> loadMore() async {
    await _loadCategory(page: currentPage + 1);
    notifyListeners();
  }

  Future<void> _loadCategory({int page = 1}) async {
    final response = await api.getTopHeadlinesForCategory(
      categoryName,
      page: page,
    );
    parseResponse(response);
  }
}
