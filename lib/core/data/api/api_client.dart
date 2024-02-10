import 'package:dio/dio.dart';
import 'package:newsapp/core/config/app_config.dart';
import 'package:newsapp/core/utils.dart';

typedef Json = Map<String, dynamic>;

class ApiException implements Exception {
  const ApiException({required this.statusCode});

  final int statusCode;

  @override
  String toString() {
    return 'ApiException(statusCode: $statusCode)';
  }
}

class ApiClient {
  ApiClient({
    required this.appConfig,
    required this.dio,
  });

  final Dio dio;
  final AppConfig appConfig;

  Future<Json> get(String url, {Map<String, dynamic>? queryParameters}) async {
    try {
      final qp = {
        'pageSize': '20',
        ...queryParameters ?? {},
        'apiKey': appConfig.newsApiKey,
      };
      final response = await dio.get(url, queryParameters: qp);
      debugLog('GET ${response.realUri} ${response.statusCode}', name: 'api');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ApiException(statusCode: response.statusCode!);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode != null) {
        debugLog(
          'GET ${e.response!.realUri} ${e.response!.statusCode}',
          name: 'api',
        );
        throw ApiException(statusCode: e.response!.statusCode!);
      }
      rethrow;
    } on Exception catch (e) {
      debugLogError('GET url:$url queryParameters:$queryParameters', e);
      rethrow;
    }
  }
}

class UrlBuilder {
  const UrlBuilder._();

  static const _baseUrl = 'https://newsapi.org/v2';

  static String urlForHeadlines() {
    return urlForApiPath('top-headlines');
  }

  static String urlForEverything() {
    return urlForApiPath('everything');
  }

  static String urlForSources() {
    return urlForApiPath('sources');
  }

  static String uriForSourceLogo(String sourceUrl) {
    return 'https://logo.clearbit.com/${Uri.parse(sourceUrl).host}';
  }

  static String urlForApiPath(String path) {
    return '$_baseUrl/$path';
  }
}
