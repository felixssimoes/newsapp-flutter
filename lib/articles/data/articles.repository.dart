import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsapp/core/data.dart';
import 'package:newsapp/core/l10n.dart';

import '../domain/article.model.dart';

part 'articles.repository.freezed.dart';
part 'articles.repository.g.dart';

class ArticlesRepository {
  ArticlesRepository(this._ref);

  final Ref _ref;

  ApiClient get _api => _ref.read(apiClientProvider);

  Future<List<Article>> getTopHeadlines({
    String? category,
    List<String>? sources,
    String? query,
    int? page,
  }) async {
    assert(
        category != null || sources != null || query != null || page != null);
    final uri = UrlBuilder.urlForHeadlines();
    final response = await _api.get(uri, queryParameters: {
      'country': 'us',
      if (category != null) 'category': category,
      if (sources != null) 'sources': sources.join(','),
      if (query != null) 'q': query,
      if (page != null) 'page': page.toString(),
    });
    return _sanitizeArticlesResponse(
      ArticlesResponse.fromJson(response).articles,
    );
  }

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
  }) async {
    assert(query != null ||
        searchIn != null ||
        sources != null ||
        domains != null ||
        excludeDomains != null ||
        fromDate != null ||
        toDate != null);
    final uri = UrlBuilder.urlForEverything();
    final response = await _api.get(uri, queryParameters: {
      'language': 'en',
      'sortBy': 'publishedAt',
      if (sources != null) 'sources': ListParam(sources, ListFormat.csv),
      if (query != null) 'q': query,
      if (page != null) 'page': page.toString(),
    });
    return _sanitizeArticlesResponse(
      ArticlesResponse.fromJson(response).articles,
    );
  }

  List<Article> _sanitizeArticlesResponse(List<Article>? articles) {
    if (articles == null) return [];
    return articles
        .where((article) => article.title != '[Removed]'.hardcoded)
        .toList();
  }
}

@freezed
class ArticlesResponse with _$ArticlesResponse {
  const factory ArticlesResponse({
    required String status,
    List<Article>? articles,
    int? totalResults,
    String? code,
    String? message,
  }) = _ArticlesResponse;

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);
}
