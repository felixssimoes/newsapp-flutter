import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/data/api/api.key.dart';

const _defaultCountry = 'pt';
const _defaultPageSize = 20;

class NewsApi {
  final http.Client client;

  NewsApi({@required this.client});

  Future<dynamic> getTopHeadlinesForCategory(String category,
      {int page = 0}) async {
    final response = await client.get(UriBuilder.getTopHeadlinesUrl(
      category,
      page: page,
    ));
    return json.decode(response.body);
  }

  Future<dynamic> getSearchArticles(String query) async {
    final response = await client.get(UriBuilder.getSearchUri(query));
    return json.decode(response.body);
  }
}

class UriBuilder {
  static Uri getTopHeadlinesUrl(String category, {int page}) {
    return _uriForPath(
      '/top-headlines',
      queryParameters: {'category': category},
    );
  }

  static Uri getSearchUri(String query, {int page}) {
    return _uriForPath(
      '/everything',
      queryParameters: {'q': query},
    );
  }

  static Uri _uriForPath(
    String path, {
    int page,
    Map<String, dynamic> queryParameters,
  }) {
    return Uri(
      scheme: 'https',
      host: 'newsapi.org',
      path: '/v2$path',
      queryParameters: {
        'apikey': kApiKey,
        'country': _defaultCountry,
        'pageSize': _defaultPageSize.toString(),
        'page': max(page ?? 1, 1).toString(),
        ...queryParameters ?? {},
      },
    );
  }
}
