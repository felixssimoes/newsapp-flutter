import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp/articles/domain/article.model.dart';
import 'package:newsapp/core/presentation.dart';

enum ArticleListTileType { normal, withImage }

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({
    required this.article,
    this.type = ArticleListTileType.normal,
    super.key,
  });

  final Article article;
  final ArticleListTileType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (type == ArticleListTileType.withImage &&
            article.urlToImage != null) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              article.urlToImage!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const Space.vertical(12),
        ],
        if (article.source.name != null) ...[
          Text(
            article.source.name!,
            style: TextStyles.poppinsMedium.copyWith(
              fontSize: 12,
              color: AppColors.battleshipGrey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Space.vertical(8),
        ],
        Text(
          article.title,
          style: TextStyles.ibmPlexSerifSemiBold.copyWith(
            fontSize: 16,
            color: AppColors.dark,
            height: 1.625,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        if (article.description != null) ...[
          const Space.vertical(8),
          Text(
            article.description!,
            style: TextStyles.poppinsRegular.copyWith(
              fontSize: 14,
              color: AppColors.blueyGrey,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
        const Space.vertical(34),
        Text(Jiffy.parseFromDateTime(article.publishedAt).fromNow(),
            style: TextStyles.poppinsItalic.copyWith(
              fontSize: 12,
              height: 1.7,
              color: AppColors.battleshipGrey,
            )),
      ],
    );
  }
}
