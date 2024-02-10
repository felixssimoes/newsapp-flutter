import 'article.model.dart';
import 'source.model.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getTopHeadlines({
    String? category,
    List<String>? sources,
    String? query,
    int? page,
  });
  Future<List<Article>> getEverything({
    String? query,
    String? searchIn,
    List<String>? sources,
    List<String>? domains,
    List<String>? excludeDomains,
    DateTime? fromDate,
    DateTime? toDate,
    String? sortBy,
    int? page,
  });
  Future<List<Source>> getSources({
    String? category,
  });
}
