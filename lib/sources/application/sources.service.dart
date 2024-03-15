import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/sources/sources.dart';

import '../data/sources.repository.dart';

class SourcesService {
  SourcesService(this._ref);
  final Ref _ref;

  SourcesRepository get _sourcesRepository =>
      _ref.read(sourcesRepositoryProvider);

  Future<void> followSource(Source source) async {
    final followedSources = await _sourcesRepository.loadFollowedSources();
    if (followedSources.contains(source.id)) return;

    followedSources.add(source.id);
    await _sourcesRepository.saveFollowedSources(followedSources);

    _ref.invalidate(followedSourcesProvider);
  }

  Future<void> unfollowSource(Source source) async {
    final followedSources = await _sourcesRepository.loadFollowedSources();
    if (!followedSources.contains(source.id)) return;

    followedSources.remove(source.id);
    await _sourcesRepository.saveFollowedSources(followedSources);

    _ref.invalidate(followedSourcesProvider);
  }
}
