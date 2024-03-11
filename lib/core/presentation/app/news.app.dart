import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/presentation.dart';

class NewsApp extends ConsumerWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'News App',
      theme: appTheme(context),
      routes: AppRouter.setupRoutes(context),
      navigatorKey: ref.watch(appRouterProvider).rootNavigatorKey,
    );
  }
}
