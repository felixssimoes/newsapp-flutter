import 'package:flutter/material.dart';
import 'package:newsapp/data/providers/shared/articles_result.provider.dart';

class SearchProvider extends ArticlesResultProvider with ChangeNotifier {
  String _searchText;

  Future<void> loadSearchNews({@required String text}) async {
    if (text.isEmpty) {
      clearResults(articles: true, totals: true);
      notifyListeners();
      return;
    }
    clearResults(articles: true);

    await _loadSearchNews(text: text);
    notifyListeners();
  }

  Future<void> loadSearchNewsNextPage() async {
    await _loadSearchNews(text: _searchText, page: currentPage + 1);
    notifyListeners();
  }

  Future<void> _loadSearchNews({@required String text, int page = 1}) async {
    _searchText = text;

    final response = await api.getSearchArticles(text);
    parseResponse(response);
  }
}
