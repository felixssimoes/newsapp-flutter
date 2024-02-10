import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.model.freezed.dart';
part 'article.model.g.dart';

@freezed
class ArticleSource with _$ArticleSource {
  const factory ArticleSource({
    required String? id,
    required String? name,
  }) = _ArticleSource;

  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      _$ArticleSourceFromJson(json);
}

@freezed
class Article with _$Article {
  const factory Article({
    required ArticleSource source,
    required String title,
    required String url,
    required DateTime publishedAt,
    required String? author,
    required String? description,
    required String? urlToImage,
    required String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
