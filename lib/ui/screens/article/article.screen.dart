import 'package:flutter/material.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({
    Key key,
    @required this.article,
  })  : assert(article != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: WebView(
        initialUrl: article.url,
      ),
    );
  }
}
