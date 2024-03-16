import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp/articles/articles.dart';

import '../../../_helpers/mocks/articles_mocks.dart';
import '../../../_helpers/mocks/shared_mocks.dart';
import '../../../_helpers/widgets.dart';

void main() {
  setUp(() {
    HttpOverrides.global = MockHttpOverrides();
  });

  group('ArticleListTile', () {
    final date = DateTime.now().subtract(const Duration(days: 1));
    final article = mockArticle(publishedAt: date);

    testWidgets('normal', (tester) async {
      await tester.pumpWidget(wrapWithMaterialApp(
        ArticleListTile(article: article),
      ));

      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.text(article.source.name!), findsOneWidget);
      expect(find.text(article.title), findsOneWidget);
      expect(find.text(article.description!), findsOneWidget);
      expect(
        find.text(Jiffy.parseFromDateTime(article.publishedAt).fromNow()),
        findsOneWidget,
      );
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('withImage', (tester) async {
      await tester.pumpWidget(
        wrapWithMaterialApp(ArticleListTile(
          article: article,
          type: ArticleListTileType.withImage,
        )),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.text(article.source.name!), findsOneWidget);
      expect(find.text(article.title), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(
        find.text(Jiffy.parseFromDateTime(article.publishedAt).fromNow()),
        findsOneWidget,
      );
    });
  });
}
