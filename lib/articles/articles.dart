import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/articles_remote.repository.dart';
import 'domain/articles.repository.dart';

export 'domain/article.model.dart';
export 'domain/articles.repository.dart';
export 'domain/categories.dart';
export 'domain/source.model.dart';
export 'presentation/widgets/article_list_tile.dart';

part 'articles.g.dart';

@Riverpod(keepAlive: true)
ArticlesRepository articlesRepository(ArticlesRepositoryRef ref) =>
    ArticlesRemoteRepository(ref);