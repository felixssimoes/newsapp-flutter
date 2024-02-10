import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/headlines/headlines.dart';

import 'widgets/category_tab_bar.dart';

class HeadlinesListScreen extends ConsumerStatefulWidget {
  const HeadlinesListScreen({super.key});

  @override
  ConsumerState<HeadlinesListScreen> createState() =>
      _HeadlinesListScreenState();
}

class _HeadlinesListScreenState extends ConsumerState<HeadlinesListScreen> {
  var _category = 'business';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: CustomScrollView(
          slivers: [
            NewsAppBar(
              title: 'Headlines'.hardcoded,
              bottom: _buildCategoriesTabBar(),
            ),
            AsyncValueWidget(
              value: ref.watch(categoryTopHeadlinesProvider(
                category: _category,
              )),
              data: (articles) => SliverList.separated(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final isFirst = index == 0;
                  return Padding(
                    padding: isFirst
                        ? const EdgeInsets.only(left: 20, right: 20, top: 30)
                        : const EdgeInsets.symmetric(horizontal: 20),
                    child: ArticleListTile(
                      article: articles[index],
                      type: isFirst
                          ? ArticleListTileType.withImage
                          : ArticleListTileType.normal,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 16,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              wrapperBuilder: (context, child) => SliverFillRemaining(
                child: child,
              ),
            ),
          ],
        ));
  }

  PreferredSize _buildCategoriesTabBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kCategoryTabBarHeight + 1),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.paleGrey,
          ),
          CategoryTabBar(
            onCategorySelected: (value) => setState(() => _category = value),
          ),
        ],
      ),
    );
  }
}
