import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/home/home.dart';

class HomeListScreenRobot {
  HomeListScreenRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpHomeListScreen({
    required ArticlesRepository repository,
    required AppRouter router,
  }) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          articlesRepositoryProvider.overrideWithValue(repository),
          appRouterProvider.overrideWithValue(router),
        ],
        child: const MaterialApp(home: HomeListScreen()),
      ),
    );
  }

  void expectToFindTitle() {
    expect(find.text('For You'.hardcoded), findsOneWidget);
  }

  void expectToFindProgressIndicator() {
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  }

  void expectToFindNArticles(int n) {
    expect(
      find.byType(ArticleListTile, skipOffstage: false),
      findsNWidgets(n),
    );
  }

  Future<void> tapArticle(int index) async {
    await tester.tap(find.byType(ArticleListTile).at(index));
    await tester.pumpAndSettle();
  }
}
