import 'package:shared_preferences/shared_preferences.dart';

class SourcesRepository {
  Future<List<String>> loadFollowedSources() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('followed_sources') ?? [];
  }

  Future<void> saveFollowedSources(List<String> sources) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('followed_sources', sources);
  }
}
