import 'package:flutter/material.dart';
import 'package:newsapp/app/navigator.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/providers/category.provider.dart';
import 'package:newsapp/data/providers/news.provider.dart';
import 'package:newsapp/ui/widgets/adaptive_progress_indicator.dart';
import 'package:newsapp/ui/widgets/adaptive_refreshable_sliver.dart';
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
  final _navigator = locator<AppNavigator>();
  final _newsProvider = locator<NewsProvider>();
  bool _isLoadingMore = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _newsProvider.getCategoryWithName(widget.categoryName),
      child: Consumer<CategoryProvider>(
        builder: (
          BuildContext context,
          CategoryProvider provider,
          Widget child,
        ) {
          return Scaffold(
            appBar: AppBar(
              title: Text(provider.categoryName),
            ),
            body: _buildContentList(context, provider),
          );
        },
      ),
    );
  }

  Widget _buildContentList(BuildContext context, CategoryProvider provider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          _onLoadMore(provider, scrollInfo);
          return false;
        },
        child: AdaptiveRefreshableSliver(
          onRefresh: () async => await _onPullToRefresh(provider),
          slivers: <Widget>[
            _buildArticlesSliver(provider),
            _buildLoadMoreSliver(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildArticlesSliver(CategoryProvider provider) {
    final size = MediaQuery.of(context).size;
    final cellWidth = (size.width - _padding * 3) / 2;
    final childAspectRatio = cellWidth / _cellHeight;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: childAspectRatio,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final article = provider.articles[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: _padding,
              right: _padding,
              top: _padding * 2,
            ),
            child: ArticleCell(
              article: article,
              onPress: () => _onPressArticle(article),
            ),
          );
        },
        childCount: provider.articles.length,
      ),
    );
  }

  Widget _buildLoadMoreSliver(CategoryProvider provider) {
    return SliverToBoxAdapter(
      child: SafeArea(
        child: provider.canLoadMore
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: _padding * 4,
                    bottom: _padding * 2,
                  ),
                  child: AdaptiveProgressIndicator(),
                ),
              )
            : Container(height: _padding * 2),
      ),
    );
  }

  Future<void> _onPullToRefresh(CategoryProvider provider) async {
    await provider.load();
  }

  void _onLoadMore(
    CategoryProvider provider,
    ScrollNotification scrollInfo,
  ) async {
    if (!_isLoadingMore &&
        provider.canLoadMore &&
        scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent * 0.8) {
      _isLoadingMore = true;
      await provider.loadMore();
      _isLoadingMore = false;
    }
  }

  void _onPressArticle(Article article) {
    _navigator.openArticleScreen(article);
  }
}
