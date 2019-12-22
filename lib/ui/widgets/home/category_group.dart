import 'package:flutter/material.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/models/category.model.dart';
import 'package:newsapp/ui/widgets/articles/article_cell.dart';

const _cellHeight = 292.0;

class CategoryGroup extends StatelessWidget {
  final Category category;
  final Function onPressViewAll;
  final Function(Article) onPressArticle;

  const CategoryGroup({
    Key key,
    @required this.category,
    @required this.onPressViewAll,
    @required this.onPressArticle,
  })  : assert(category != null),
        assert(onPressViewAll != null),
        assert(onPressArticle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _cellHeight,
      margin: const EdgeInsets.only(left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildGroupHeader(context),
          _buildArticlesList(),
        ],
      ),
    );
  }

  Widget _buildGroupHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: <Widget>[
          Text(
            category.name,
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

  Widget _buildArticlesList() {
    return Expanded(
      child: ListView(
        itemExtent: 195,
        scrollDirection: Axis.horizontal,
        children: category.articles
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
