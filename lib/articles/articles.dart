import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/articles.repository.dart';

export 'data/articles.repository.dart';
export 'domain/article.model.dart';
export 'domain/categories.dart';
export 'domain/source.model.dart';
export 'presentation/details/article_details.screen.dart';
export 'presentation/widgets/article_list_tile.dart';

part 'articles.g.dart';

@Riverpod(keepAlive: true)
ArticlesRepository articlesRepository(ArticlesRepositoryRef ref) =>
    ArticlesRepository(ref);
