import 'package:http/http.dart' as http;
import 'package:newsapp/data/api/api.key.dart';

const _baseUrl = 'https://newsapi.org/v2';
const _defaultCountry = 'pt';
const _defaultPageSize = 20;

class NewsApi {
  final http.Client client;

  NewsApi({this.client});

  Future<dynamic> getNewsForCategory(String category, {int page = 0}) async {
    final response = await client.get(_getNewsHeadlinesUrl(
      category,
      page: page,
    ));
    print(response.body);
    return null;
  }

  String _getNewsHeadlinesUrl(
    String category, {
    int page,
    int pageSize = _defaultPageSize,
    String country = _defaultCountry,
  }) {
    final pageParam = ((page ?? 0) > 0) ? '&page=$page' : '';
    return '$_baseUrl/top-headlines?apikey=$kApiKey&pageSize=$pageSize&country=$country&category=$category$pageParam';
  }
}
