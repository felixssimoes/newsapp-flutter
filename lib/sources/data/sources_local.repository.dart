import 'package:shared_preferences/shared_preferences.dart';

import '../domain/sources.repository.dart';

class SourcesLocalRepository implements SourcesRepository {
  @override
  Future<List<String>> loadFollowedSources() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('followed_sources') ?? [];
  }

  @override
  Future<void> saveFollowedSources(List<String> sources) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('followed_sources', sources);
  }
}
