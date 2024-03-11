import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/sources/sources.dart';

import '../app/app_container.dart';

class AppRouter {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  static Map<String, WidgetBuilder> setupRoutes(BuildContext context) {
    return {
      '/': (_) => const AppContainer(),
    };
  }

  void openArticleDetails(Article article) {
    _pushScreen((context) => ArticleDetailsScreen(article: article));
  }

  void openCategorySources(String category) {
    _pushScreen((context) => CategorySourcesScreen(category: category));
  }

  // private api

  void _pushScreen(WidgetBuilder builder) {
    rootNavigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: builder,
      ),
    );
  }
}
