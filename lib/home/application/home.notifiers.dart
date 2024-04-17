import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/sources/sources.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.notifiers.g.dart';

@Riverpod(keepAlive: true)
Future<List<Article>> homeArticles(HomeArticlesRef ref) async {
  final sources = await ref.watch(followedSourcesProvider.future);
  if (sources.isEmpty) return const [];
  return ref.watch(articlesRepositoryProvider).getEverything(sources: sources);
}
