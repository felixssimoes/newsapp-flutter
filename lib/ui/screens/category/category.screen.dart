import 'package:flutter/material.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/providers/category.provider.dart';
import 'package:newsapp/data/providers/news.provider.dart';
import 'package:newsapp/ui/widgets/articles/article_cell.dart';
import 'package:provider/provider.dart';

const _padding = 6.0;
const _cellHeight = 240;

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({Key key, @required this.categoryName})
      : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _newsProvider = locator<NewsProvider>();
  bool _isLoadingMore = false;

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
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!_isLoadingMore &&
              provider.canLoadMore &&
              scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent * 0.8) {
            _isLoadingMore = true;
            provider.loadMore().then((_) => _isLoadingMore = false);
          }
          return false;
        },
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
              child: provider.canLoadMore
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      height: _padding * 2,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
