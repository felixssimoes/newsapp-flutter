import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/data/api/api.key.dart';

const _baseUrl = 'https://newsapi.org/v2';
const _defaultCountry = 'pt';
const _defaultPageSize = 20;

class NewsApi {
  final http.Client client;

  NewsApi({@required this.client});

  Future<dynamic> getTopHeadlinesForCategory(String category,
      {int page = 0}) async {
    final response = await client.get(_getTopHeadlinesUrl(
      category,
      page: page,
    ));
    return json.decode(response.body);
  }

  String _getTopHeadlinesUrl(
    String category, {
    int page,
    int pageSize = _defaultPageSize,
    String country = _defaultCountry,
  }) {
    final pageParam = ((page ?? 0) > 0) ? '&page=$page' : '';
    return '$_baseUrl/top-headlines?apikey=$kApiKey&pageSize=$pageSize&country=$country&category=$category$pageParam';
  }
}
