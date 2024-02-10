import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'config.dart';
import 'data/api/api_client.dart';

export 'data/api/api_client.dart';

part 'data.g.dart';

@riverpod
Dio dio(DioRef ref) => Dio();

@riverpod
ApiClient apiClient(ApiClientRef ref) => ApiClient(
      dio: ref.watch(dioProvider),
      appConfig: ref.watch(appConfigProvider),
    );
