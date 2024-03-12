import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/sources/sources.dart';

import 'widgets/source_details_header.dart';

class SourceDetailsScreen extends ConsumerWidget {
  const SourceDetailsScreen({
    required this.source,
    super.key,
  });

  final Source source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsAppBar(title: source.name),
          SliverToBoxAdapter(
            child: SourceDetailsHeader(source: source),
          ),
          AsyncValueWidget(
            value: ref.watch(sourceArticlesProvider(source)),
            data: (articles) => SliverList.separated(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ArticleListTile(
                  article: articles[index],
                  type: index % 3 == 0
                      ? ArticleListTileType.withImage
                      : ArticleListTileType.normal,
                  hideSource: true,
                ),
              ),
              itemCount: articles.length,
              separatorBuilder: (context, index) => const Divider(
                height: 32,
                indent: 20,
                endIndent: 20,
              ),
            ),
            wrapperBuilder: (context, child) => SliverFillRemaining(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
