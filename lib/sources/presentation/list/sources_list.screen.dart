import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';

import 'widgets/category_sources_preview_list.dart';

class SourcesListScreen extends StatelessWidget {
  const SourcesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          NewsAppBar(title: 'Sources'.hardcoded),
          SliverList.separated(
            itemCount: kCategories.length,
            itemBuilder: (context, index) {
              final category = kCategories[index];
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(top: 16)
                    : EdgeInsets.zero,
                child: CategorySourcesPreviewList(category: category),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 32,
              indent: 20,
              endIndent: 20,
            ),
          ),
        ],
      ),
    );
  }
}
