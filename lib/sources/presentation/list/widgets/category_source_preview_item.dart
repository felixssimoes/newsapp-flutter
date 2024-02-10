import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/presentation.dart';

import 'category_following_button.dart';
import 'category_source_icon_preview.dart';

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
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(104 / 2),
              border: Border.all(
                color: AppColors.lightPeriwinkle,
                width: 1,
              ),
            ),
            child: CategorySourceIconPreview(
              source: source,
              size: 104,
            ),
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
          CategoryFollowingButton(source: source),
        ],
      ),
    );
  }
}
