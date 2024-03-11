import 'package:flutter/material.dart';
import 'package:newsapp/articles/domain/source.model.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/sources/presentation/widgets/category_source_icon.dart';
import 'package:newsapp/sources/presentation/widgets/source_following_button.dart';

class SourceListTile extends StatelessWidget {
  const SourceListTile({
    required this.source,
    super.key,
  });

  final Source source;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategorySourceIcon(
          source: source,
          size: 104,
        ),
        const Space.horizontal(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                source.name,
                style: TextStyles.poppinsBold.copyWith(
                  fontSize: 16,
                ),
              ),
              Text(
                source.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.poppinsRegular.copyWith(
                  fontSize: 12,
                  color: AppColors.blueyGrey,
                ),
              ),
              const Space.vertical(16),
              SourceFollowingButton(source: source),
            ],
          ),
        ),
      ],
    );
  }
}