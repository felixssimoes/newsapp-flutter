import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/presentation.dart';

import '../../widgets/category_source_icon.dart';
import '../../widgets/source_following_button.dart';

class CategorySourcePreviewItem extends StatelessWidget {
  const CategorySourcePreviewItem({
    required this.source,
    super.key,
  });

  final Source source;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 104,
      child: Column(
        children: [
          CategorySourceIcon(
            source: source,
            size: 104,
          ),
          const Space.vertical(12),
          Text(
            source.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.poppinsRegular.copyWith(
              color: AppColors.dark,
              fontSize: 14,
            ),
          ),
          const Space.vertical(12),
          SourceFollowingButton(source: source),
        ],
      ),
    );
  }
}
