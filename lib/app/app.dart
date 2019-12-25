import 'package:flutter/material.dart';
import 'package:newsapp/app/navigator.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/providers/news.provider.dart';
import 'package:newsapp/data/providers/search.provider.dart';
import 'package:provider/provider.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<NewsProvider>()),
        ChangeNotifierProvider(create: (_) => locator<SearchProvider>()),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: AppNavigator.setupRoutes(context),
        navigatorKey: locator<AppNavigator>().rootNavigatorKey,
      ),
    );
  }
}
