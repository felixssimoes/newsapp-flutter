import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../_helpers/mocks/articles_mocks.dart';
import '../../../_helpers/mocks/shared_mocks.dart';
import 'home_list.screen_test.mocks.dart';
import 'home_list_screen_robot.dart';

@GenerateMocks([
  AppRouter,
  ArticlesRepository,
])
void main() {
  setUp(() {
    HttpOverrides.global = MockHttpOverrides();
    SharedPreferences.setMockInitialValues({});
  });
  group('HomeListScreen', () {
    testWidgets('initialization and article selection', (tester) async {
      final repository = MockArticlesRepository();
      final router = MockAppRouter();
      final prefs = await SharedPreferences.getInstance();

      final articles = [
        mockArticle(),
        mockArticle(),
        mockArticle(),
      ];
      final sourceIds =
          articles.map((e) => e.source.id).whereType<String>().toList();

      when(repository.getEverything(
        query: anyNamed('query'),
        searchIn: anyNamed('searchIn'),
        domains: anyNamed('domains'),
        sources: anyNamed('sources'),
        excludeDomains: anyNamed('excludeDomains'),
        fromDate: anyNamed('fromDate'),
        toDate: anyNamed('toDate'),
        page: anyNamed('page'),
        sortBy: anyNamed('sortBy'),
      )).thenAnswer((_) async => articles);

      prefs.setStringList(
        'followed_sources',
        sourceIds,
      );

      final r = HomeListScreenRobot(tester);
      await r.pumpHomeListScreen(
        repository: repository,
        router: router,
      );

      r.expectToFindProgressIndicator();

      await tester.pumpAndSettle();

      r.expectToFindTitle();
      r.expectToFindNArticles(3);
      verify(repository.getEverything(
        query: null,
        searchIn: null,
        domains: null,
        sources: sourceIds,
        excludeDomains: null,
        fromDate: null,
        toDate: null,
        page: null,
        sortBy: null,
      )).called(1);
      verifyNoMoreInteractions(repository);
      verifyZeroInteractions(router);

      await r.tapArticle(0);

      verify(router.openArticleDetails(articles[0])).called(1);
      verifyNoMoreInteractions(repository);
      verifyNoMoreInteractions(router);
    });
  });
}
