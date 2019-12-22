import 'package:flutter/material.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/models/category.model.dart';
import 'package:newsapp/ui/screens/article/article.screen.dart';
import 'package:newsapp/ui/screens/category/category.screen.dart';
import 'package:newsapp/ui/screens/home/home.screen.dart';

class AppRoutes {
  static const root = '/';
  static const category = '/category';
  static const article = '/article';
}

class AppNavigator {
  static Map<String, WidgetBuilder> setupRoutes(BuildContext context) {
    return {
      AppRoutes.root: (_) => HomeScreen(),
      AppRoutes.category: (context) {
        final category = ModalRoute.of(context).settings.arguments;
        return CategoryScreen(category: category);
      },
      AppRoutes.article: (context) {
        final article = ModalRoute.of(context).settings.arguments;
        return ArticleScreen(article: article);
      }
    };
  }

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  bool pop([value]) {
    return rootNavigatorKey.currentState.pop(value);
  }

  void openCategoryScreen(Category category) {
    rootNavigatorKey.currentState.pushNamed(
      AppRoutes.category,
      arguments: category,
    );
  }

  void openArticleScreen(Article article) {
    rootNavigatorKey.currentState.pushNamed(
      AppRoutes.article,
      arguments: article,
    );
  }
}
