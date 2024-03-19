import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newsapp/core/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/source.model.dart';

part 'sources.repository.freezed.dart';
part 'sources.repository.g.dart';

class SourcesRepository {
  SourcesRepository(this._ref);

  final Ref _ref;

  ApiClient get _api => _ref.read(apiClientProvider);

  Future<List<String>> loadFollowedSources() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('followed_sources') ?? [];
  }

  Future<void> saveFollowedSources(List<String> sources) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('followed_sources', sources);
  }

  Future<List<Source>> getSources({
    String? category,
  }) async {
    final uri = UrlBuilder.urlForSources();
    final response = await _api.get(uri, queryParameters: {
      'language': 'en',
      if (category != null) 'category': category,
    });
    return SourcesResponse.fromJson(response).sources ?? [];
  }
}

@freezed
class SourcesResponse with _$SourcesResponse {
  const factory SourcesResponse({
    required String status,
    List<Source>? sources,
    String? code,
    String? message,
  }) = _SourcesResponse;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$SourcesResponseFromJson(json);
}
