import 'package:flutter/material.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/providers/category.provider.dart';
import 'package:newsapp/ui/widgets/articles/article_cell.dart';
import 'package:provider/provider.dart';

const _cellHeight = 292.0;

class CategoryGroup extends StatelessWidget {
  final Function onPressViewAll;
  final Function(Article) onPressArticle;

  const CategoryGroup({
    Key key,
    @required this.onPressViewAll,
    @required this.onPressArticle,
  })  : assert(onPressViewAll != null),
        assert(onPressArticle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (BuildContext context, CategoryProvider provider, Widget child) {
        return Container(
          height: _cellHeight,
          margin: const EdgeInsets.only(left: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildGroupHeader(context, provider),
              _buildArticlesList(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGroupHeader(BuildContext context, CategoryProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(
            provider.categoryName,
            textAlign: TextAlign.left,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text('View All',
                style: TextStyle(
                  color: Color(0xFFD1644F),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
            onPressed: onPressViewAll,
          )
        ],
      ),
    );
  }

  Widget _buildArticlesList(CategoryProvider provider) {
    return Expanded(
      child: ListView(
        itemExtent: 195,
        scrollDirection: Axis.horizontal,
        children: provider.articles
            .take(6)
            .map((article) => Padding(
                  padding: const EdgeInsets.only(right: 6, left: 6, bottom: 12),
                  child: ArticleCell(
                    article: article,
                    onPress: () => onPressArticle(article),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
