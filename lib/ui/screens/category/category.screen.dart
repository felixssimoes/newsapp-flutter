import 'package:flutter/material.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/providers/category.provider.dart';
import 'package:newsapp/data/providers/news.provider.dart';
import 'package:newsapp/ui/widgets/articles/article_cell.dart';
import 'package:provider/provider.dart';

const _padding = 6.0;
const _cellHeight = 232;

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({Key key, @required this.categoryName})
      : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final NewsProvider _newsProvider = locator();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _newsProvider.getCategoryWithName(widget.categoryName),
      child: Consumer<CategoryProvider>(
        builder:
            (BuildContext context, CategoryProvider provider, Widget child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(provider.categoryName),
            ),
            body: _buildArticlesList(context, provider),
          );
        },
      ),
    );
  }

  Widget _buildArticlesList(BuildContext context, CategoryProvider provider) {
    final size = MediaQuery.of(context).size;
    final cellWidth = (size.width - _padding * 3) / 2;
    final childAspectRatio = cellWidth / _cellHeight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: childAspectRatio,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final article = provider.articles[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      left: _padding, right: _padding, top: _padding * 2),
                  child: ArticleCell(article: article, onPress: () {}),
                );
              },
              childCount: provider.articles.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: _padding * 2,
            ),
          ),
        ],
      ),
    );
  }
}
