import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/home/home.dart';
import 'package:newsapp/home/presentation/list/widgets/home_empty.dart';

import '../../../_helpers/widgets.dart';

class HomeListScreenRobot {
  HomeListScreenRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpHomeListScreen({
    required ArticlesRepository repository,
    required AppRouter router,
  }) async {
    await tester.pumpWidget(
      wrapWithProviderScopeAndMaterialApp(
        const HomeListScreen(),
        articlesRepository: repository,
        router: router,
      ),
    );
  }

  void expectToFindTitle() {
    expect(find.text('For You'.hardcoded), findsOneWidget);
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

  void expectToFindEmpty() {
    expect(find.byType(HomeEmpty), findsOneWidget);
  }

  Future<void> tapArticle(int index) async {
    await tester.tap(find.byType(ArticleListTile).at(index));
    await tester.pumpAndSettle();
  }
}
