import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/core/utils.dart';
import 'package:newsapp/sources/sources.dart';

import 'category_source_preview_item.dart';

class CategorySourcesPreviewList extends ConsumerWidget {
  const CategorySourcesPreviewList({
    required this.category,
    super.key,
  });

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              category.capitalize().hardcoded,
              style: TextStyles.ibmPlexSerifRegular.copyWith(
                color: AppColors.dark,
                fontSize: 24,
                height: 1.5,
              ),
            ),
          ),
          Space.m(),
          SizedBox(
            height: 200,
            child: AsyncValueWidget(
                value: ref.watch(categorySourcesProvider(
                  category: category,
                )),
                data: (sources) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: min(sources.length, 3),
                    separatorBuilder: (context, index) => Space.l(),
                    itemBuilder: (context, index) {
                      final source = sources[index];
                      return CategorySourcePreviewItem(source: source);
                    },
                  );
                }),
          ),
          const Spacer(),
          TextButton(
            onPressed: () =>
                ref.read(appRouterProvider).openCategorySources(category),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('See more ${category.capitalize().hardcoded}'.hardcoded,
                      textAlign: TextAlign.center,
                      style: TextStyles.poppinsRegular.copyWith(
                        color: AppColors.camo,
                        fontSize: 14,
                        height: 1.5,
                      )),
                  Space.xs(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.camo,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
