import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/app/navigator.dart';
import 'package:newsapp/data/api/news.api.dart';
import 'package:newsapp/data/providers/news.provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppNavigator>(
    () => AppNavigator(),
  );

  locator.registerLazySingleton<NewsApi>(
    () => NewsApi(client: http.Client()),
  );

  locator.registerLazySingleton<NewsProvider>(
    () => NewsProvider(),
  );
}
