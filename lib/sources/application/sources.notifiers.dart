import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/sources/sources.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sources.notifiers.g.dart';

@Riverpod(keepAlive: true)
Future<List<Source>> allSources(AllSourcesRef ref) async {
  return ref.watch(sourcesRepositoryProvider).getSources();
}

@Riverpod(keepAlive: true)
Future<List<Source>> categorySources(
  CategorySourcesRef ref, {
  required String category,
}) async {
  final allSources = await ref.watch(allSourcesProvider.future);
  return allSources.where((source) => source.category == category).toList();
}

@Riverpod(keepAlive: true)
Future<List<String>> followedSources(FollowedSourcesRef ref) async {
  return ref.watch(sourcesRepositoryProvider).loadFollowedSources();
}

@Riverpod(keepAlive: true)
Future<bool> isFollowingSource(
  IsFollowingSourceRef ref, {
  required String sourceId,
}) async {
  final followedSources = await ref.watch(followedSourcesProvider.future);
  return followedSources.contains(sourceId);
}

@Riverpod(keepAlive: true)
Future<List<Article>> sourceArticles(
  SourceArticlesRef ref,
  Source source,
) async {
  return ref
      .watch(articlesRepositoryProvider)
      .getEverything(sources: [source.id]);
}
