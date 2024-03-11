import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';

import '../../application/home.notifiers.dart';

class HomeListScreen extends ConsumerWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        NewsAppBar(title: 'For You'.hardcoded),
        AsyncValueWidget(
          value: ref.watch(homeArticlesProvider),
          data: (articles) {
            return SliverList.separated(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final isFirst = index == 0;
                final showImage = index % 3 == 0;
                final article = articles[index];
                return GestureDetector(
                  onTap: () =>
                      ref.read(appRouterProvider).openArticleDetails(article),
                  child: Padding(
                    padding: isFirst
                        ? const EdgeInsets.only(left: 20, right: 20, top: 30)
                        : const EdgeInsets.symmetric(horizontal: 20),
                    child: ArticleListTile(
                      article: article,
                      type: showImage
                          ? ArticleListTileType.withImage
                          : ArticleListTileType.normal,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 32,
                indent: 20,
                endIndent: 20,
              ),
            );
          },
          wrapperBuilder: (context, child) => SliverFillRemaining(
            child: child,
          ),
        ),
      ]),
    );
  }
}
