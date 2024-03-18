import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../_helpers/mocks/articles_mocks.dart';
import '../../../_helpers/mocks/shared_mocks.dart';
import 'headlines_list.screen_test.mocks.dart';
import 'headlines_list_screen_robot.dart';

@GenerateMocks([
  AppRouter,
  ArticlesRepository,
])
void main() {
  setUp(() {
    HttpOverrides.global = MockHttpOverrides();
    SharedPreferences.setMockInitialValues({});
  });
  group('HeadlinesListScreen', () {
    testWidgets('intialization and basic features', (tester) async {
      final repository = MockArticlesRepository();
      final router = MockAppRouter();

      final businessArticles = [
        mockArticle(),
        mockArticle(),
        mockArticle(),
      ];
      final entertainmentArticles = [
        mockArticle(),
        mockArticle(),
      ];
      when(repository.getTopHeadlines(
        category: 'business',
        query: anyNamed('query'),
        sources: anyNamed('sources'),
        page: anyNamed('page'),
      )).thenAnswer((_) async => businessArticles);
      when(repository.getTopHeadlines(
        category: 'entertainment',
        query: anyNamed('query'),
        sources: anyNamed('sources'),
        page: anyNamed('page'),
      )).thenAnswer((_) async => entertainmentArticles);

      final r = HeadlinesListScreenRobot(tester);
      await r.pumpHeadlinesListScreen(
        repository: repository,
        router: router,
      );

      r.expectToFindTitle();
      r.expectToFindProgressIndicator(true);

      await tester.pumpAndSettle();

      r.expectToFindNArticles(3);
      r.expectToFindProgressIndicator(false);
      verify(repository.getTopHeadlines(
        category: 'business',
        query: null,
        sources: null,
        page: null,
      )).called(1);
      verifyNoMoreInteractions(repository);
      verifyZeroInteractions(router);

      await r.tapArticle(0);

      verify(router.openArticleDetails(businessArticles[0])).called(1);
      verifyNoMoreInteractions(repository);
      verifyNoMoreInteractions(router);

      await r.tapCategoryTab('Entertainment'.hardcoded);

      r.expectToFindNArticles(2);
      r.expectToFindProgressIndicator(false);
      verify(repository.getTopHeadlines(
        category: 'entertainment',
        query: null,
        sources: null,
        page: null,
      )).called(1);
      verifyNoMoreInteractions(router);

      await r.tapCategoryTab('Business'.hardcoded);

      r.expectToFindNArticles(3);
      r.expectToFindProgressIndicator(false);
      verifyNoMoreInteractions(repository);
      verifyNoMoreInteractions(router);
    });
  });
}
