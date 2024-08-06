import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/sources/sources.dart';

import '../../widgets/category_source_icon.dart';
import '../../widgets/source_following_button.dart';

class CategorySourcePreviewItem extends ConsumerWidget {
  const CategorySourcePreviewItem({
    required this.source,
    super.key,
  });

  final Source source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 104,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => ref.read(appRouterProvider).openSourceDetails(source),
            child: CategorySourceIcon(
              source: source,
              size: 104,
            ),
          ),
          Space.m,
          Text(
            source.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.poppinsRegular.copyWith(
              color: AppColors.dark,
              fontSize: 14,
            ),
          ),
          Space.s,
          SourceFollowingButton(source: source),
        ],
      ),
    );
  }
}
