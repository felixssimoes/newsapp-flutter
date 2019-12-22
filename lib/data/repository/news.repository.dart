import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/api/news.api.dart';
import 'package:newsapp/data/models/category.model.dart';

class NewsRepository {
  final _api = locator<NewsApi>();

  Future<Category> loadTopHeadlinesForCategory(
    String category, {
    int page = 1,
  }) async {
    final response = await _api.getTopHeadlinesForCategory(
      category,
      page: page,
    );
    return Category.fromJson(category, response);
  }
}
