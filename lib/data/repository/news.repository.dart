import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/api/news.api.dart';
import 'package:newsapp/data/models/category.model.dart';

class NewsRepository {
  final _api = locator<NewsApi>();

  Future<Category> loadTopHeadlinesForCategory(String category) async {
    final response = await _api.getTopHeadlinesForCategory(category);
    return Category.fromJson(category, response);
  }
}
