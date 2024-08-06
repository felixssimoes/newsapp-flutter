import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:newsapp/articles/domain/article.model.dart';
import 'package:newsapp/core/presentation.dart';

enum ArticleListTileType { normal, withImage }

class ArticleListTile extends ConsumerWidget {
  const ArticleListTile({
    required this.article,
    this.type = ArticleListTileType.normal,
    this.hideSource = false,
    super.key,
  });

  final Article article;
  final ArticleListTileType type;
  final bool hideSource;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(appRouterProvider).openArticleDetails(article),
      child: Column(
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
            Space.m,
          ],
          if (article.source.name != null && !hideSource) ...[
            Text(
              article.source.name!,
              style: TextStyles.poppinsMedium.copyWith(
                fontSize: 12,
                color: AppColors.battleshipGrey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Space.s,
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
            Space.s,
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
          Space.l,
          Text(Jiffy.parseFromDateTime(article.publishedAt).fromNow(),
              style: TextStyles.poppinsItalic.copyWith(
                fontSize: 12,
                height: 1.7,
                color: AppColors.battleshipGrey,
              )),
        ],
      ),
    );
  }
}
