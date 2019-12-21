import 'package:flutter/foundation.dart';

class Article {
  final String title;
  final String imageUrl;
  final String source;
  final String teaserText;
  final DateTime publishedAt;
  final String url;

  Article._({
    @required this.title,
    @required this.imageUrl,
    @required this.source,
    @required this.teaserText,
    @required this.publishedAt,
    @required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    try {
      return Article._(
        title: json['title'],
        imageUrl: json['urlToImage'],
        source: json['source']['name'],
        teaserText: json['content'] ?? json['description'] ?? '',
        publishedAt: DateTime.parse(json['publishedAt']),
        url: json['url'],
      );
    } catch (_) {
      return null;
    }
  }
}
