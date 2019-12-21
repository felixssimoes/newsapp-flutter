import 'package:flutter/material.dart';
import 'package:newsapp/data/models/category.model.dart';
import 'package:newsapp/ui/widgets/articles/article_cell.dart';

const _cellHeight = 280.0;

class CategoryGroup extends StatelessWidget {
  final Category category;

  const CategoryGroup({
    Key key,
    @required this.category,
  })  : assert(category != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _cellHeight,
      margin: const EdgeInsets.only(left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              category.name,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              itemExtent: 195,
              scrollDirection: Axis.horizontal,
              children: category.articles
                  .take(6)
                  .map((article) => Padding(
                        padding: const EdgeInsets.only(
                            right: 6, left: 6, bottom: 12),
                        child: ArticleCell(article: article, onPress: () {}),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
