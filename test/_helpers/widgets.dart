// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/presentation.dart';

Widget wrapWithProviderScopeAndMaterialApp(
  Widget widget, {
  AppRouter? router,
  ArticlesRepository? articlesRepository,
}) {
  return ProviderScope(
    overrides: [
      if (router != null) appRouterProvider.overrideWithValue(router),
      if (articlesRepository != null)
        articlesRepositoryProvider.overrideWithValue(articlesRepository),
    ],
    child: wrapWithMaterialApp(widget),
  );
}

Widget wrapWithMaterialApp(Widget widget) {
  return MaterialApp(home: widget);
}
