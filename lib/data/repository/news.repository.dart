import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/api/news.api.dart';
import 'package:newsapp/data/models/category.model.dart';

const kNewsCategories = [
  'business',
  'entertainment',
  'general',
  'health',
  'science',
  'sports',
  'technology',
];

class NewsRepository {
  final _api = locator<NewsApi>();

  Future<List<Category>> loadTopHeadlinesForAllCategories() async {
    return await Future.wait(kNewsCategories
        .map((category) => loadTopHeadlinesForCategory(category)));
  }

  Future<Category> loadTopHeadlinesForCategory(String category) async {
    final response = await _api.getTopHeadlinesForCategory(category);
    return Category.fromJson(category, response);
  }
}
