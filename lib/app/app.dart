import 'package:flutter/material.dart';
import 'package:newsapp/app/navigator.dart';
import 'package:newsapp/config/locator.config.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: AppNavigator.setupRoutes(context),
      navigatorKey: locator<AppNavigator>().rootNavigatorKey,
    );
  }
}
