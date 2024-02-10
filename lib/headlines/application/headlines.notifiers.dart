import 'package:newsapp/articles/articles.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'headlines.notifiers.g.dart';

@Riverpod(keepAlive: true)
Future<List<Article>> categoryTopHeadlines(
  CategoryTopHeadlinesRef ref, {
  required String category,
}) async {
  final articlesRepository = ref.watch(articlesRepositoryProvider);
  return articlesRepository.getTopHeadlines(category: category);
}
