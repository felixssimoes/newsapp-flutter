abstract class SourcesRepository {
  Future<List<String>> loadFollowedSources();
  Future<void> saveFollowedSources(List<String> sources);
}
