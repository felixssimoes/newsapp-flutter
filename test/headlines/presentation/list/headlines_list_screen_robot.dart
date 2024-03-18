import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/headlines/headlines.dart';

import '../../../_helpers/widgets.dart';

class HeadlinesListScreenRobot {
  HeadlinesListScreenRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpHeadlinesListScreen({
    required ArticlesRepository repository,
    required AppRouter router,
  }) async {
    await tester.pumpWidget(
      wrapWithProviderScopeAndMaterialApp(
        const HeadlinesListScreen(),
        articlesRepository: repository,
        router: router,
      ),
    );
  }

  void expectToFindTitle() {
    expect(find.text('Headlines'.hardcoded), findsOneWidget);
  }

  void expectToFindProgressIndicator(bool visible) {
    expect(
      find.byType(CircularProgressIndicator),
      visible ? findsOneWidget : findsNothing,
    );
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

  Future<void> tapCategoryTab(String s) async {
    await tester.tap(find.text(s));
    await tester.pumpAndSettle();
  }
}
