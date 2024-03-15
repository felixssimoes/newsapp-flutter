import 'package:mock_data/mock_data.dart';
import 'package:newsapp/articles/articles.dart';

Article mockArticle({
  ArticleSource? source,
  String? title,
  String? url,
  DateTime? publishedAt,
  String? author,
  String? description,
  String? urlToImage,
  String? content,
}) {
  return Article(
    source: source ?? mockArticleSource(),
    title: title ?? mockString(),
    url: url ?? mockUrl(),
    publishedAt: publishedAt ?? DateTime.now(),
    author: author ?? mockName(),
    description: description ?? mockString(),
    urlToImage: urlToImage ?? mockUrl('*', true),
    content: content ?? mockString(),
  );
}

ArticleSource mockArticleSource({
  String? id,
  String? name,
}) {
  return ArticleSource(
    id: id ?? mockUUID(),
    name: name ?? mockName(),
  );
}
