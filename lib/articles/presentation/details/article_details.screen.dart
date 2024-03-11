import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setOnScrollPositionChange((change) {})
      ..loadRequest(Uri.parse(widget.article.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.article.source.name ?? '',
          style: TextStyles.ibmPlexSerifSemiBold.copyWith(fontSize: 20),
        ),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            width: double.infinity,
            height: 1,
            color: AppColors.paleGrey,
          ),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
