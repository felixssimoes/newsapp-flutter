import 'package:flutter/material.dart';
import 'package:newsapp/core/presentation.dart';

import 'app_container.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: appTheme(context),
      home: const AppContainer(),
    );
  }
}
