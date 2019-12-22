import 'package:flutter/material.dart';
import 'package:newsapp/data/models/article.model.dart';

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
      body: Text(article.teaserText),
    );
  }
}
