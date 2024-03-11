import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/core/utils.dart';
import 'package:newsapp/sources/sources.dart';

import '../widgets/source_list_tile.dart';

class CategorySourcesScreen extends ConsumerWidget {
  const CategorySourcesScreen({
    required this.category,
    super.key,
  });

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsAppBar(title: category.capitalize().hardcoded),
          AsyncValueWidget(
            value: ref.watch(categorySourcesProvider(category: category)),
            data: (sources) => SliverList.separated(
              itemCount: sources.length,
              itemBuilder: (context, index) {
                final source = sources[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SourceListTile(source: source),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 32,
                indent: 20,
                endIndent: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
