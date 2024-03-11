import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';

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

  // private api

  void _pushScreen(WidgetBuilder builder) {
    rootNavigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: builder,
      ),
    );
  }
}
