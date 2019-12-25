import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/app/navigator.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/providers/search.provider.dart';
import 'package:newsapp/ui/widgets/adaptive_progress_indicator.dart';
import 'package:newsapp/ui/widgets/adaptive_refreshable_sliver.dart';
import 'package:newsapp/ui/widgets/articles/article_cell.dart';
import 'package:provider/provider.dart';

const _cellHeight = 140.0;
const _padding = 6.0;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _navigator = locator<AppNavigator>();
  final _searchController = TextEditingController();
  Timer timeHandle;
  bool _isLoadingMore = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Provider.of<SearchProvider>(context, listen: false).reset(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContentList(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 4,
      title: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              _buildSearchField(),
              _buildClearSearchButton(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildSearchField() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter search text...',
          ),
          onChanged: _onChangedSearchText,
        ),
      ),
    );
  }

  IconButton _buildClearSearchButton() {
    return IconButton(
      icon: Icon(
        Icons.cancel,
        color: Colors.black45,
      ),
      onPressed: () {
        _searchController.text = '';
        Provider.of<SearchProvider>(context, listen: false)
            .loadSearchNews(text: '');
      },
    );
  }

  Widget _buildContentList() {
    return Consumer<SearchProvider>(
        builder: (BuildContext context, SearchProvider provider, Widget child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: _padding),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            _onLoadMore(scrollInfo);
            return false;
          },
          child: AdaptiveRefreshableSliver(
            onRefresh: () async => await _onPullToRefresh(),
            slivers: <Widget>[
              _buildArticlesSliver(provider),
              _buildLoadMoreSliver(provider),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildArticlesSliver(SearchProvider provider) {
    final size = MediaQuery.of(context).size;
    final cellWidth = (size.width - _padding * 3);
    final childAspectRatio = cellWidth / _cellHeight;

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
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
              layout: ArticleCellLayout.Horizontal,
              onPress: () => _onPressArticle(article),
            ),
          );
        },
        childCount: provider.articles.length,
      ),
    );
  }

  Widget _buildLoadMoreSliver(SearchProvider provider) {
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

  void _onChangedSearchText(String value) {
    if (timeHandle != null) {
      timeHandle.cancel();
    }
    timeHandle = Timer(Duration(milliseconds: 250), () {
      _doSearch(value);
    });
  }

  Future<void> _onPullToRefresh() async {
    await Provider.of<SearchProvider>(context, listen: false)
        .loadSearchNews(text: _searchController.text);
  }

  Future<void> _doSearch(String value) async {
    print("Calling now the API: $value");
    final provider = Provider.of<SearchProvider>(context, listen: false);
    await provider.loadSearchNews(text: value);
  }

  void _onLoadMore(
    ScrollNotification scrollInfo,
  ) async {
    final provider = Provider.of<SearchProvider>(context, listen: false);
    if (!_isLoadingMore &&
        provider.canLoadMore &&
        scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent * 0.8) {
      _isLoadingMore = true;
      await provider.loadSearchNewsNextPage();
      _isLoadingMore = false;
    }
  }

  void _onPressArticle(Article article) {
    _navigator.openArticleScreen(article);
  }
}
