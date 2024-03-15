import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'application/sources.service.dart';
import 'data/sources_local.repository.dart';
import 'domain/sources.repository.dart';

export 'application/sources.notifiers.dart';
export 'domain/sources.repository.dart';
export 'presentation/category_sources/category_sources.screen.dart';
export 'presentation/list/sources_list.screen.dart';
export 'presentation/source_details/source_details.screen.dart';

part 'sources.g.dart';

@Riverpod(keepAlive: true)
SourcesRepository sourcesRepository(SourcesRepositoryRef ref) =>
    SourcesLocalRepository();

@Riverpod(keepAlive: true)
SourcesService sourcesService(SourcesServiceRef ref) => SourcesService(ref);
