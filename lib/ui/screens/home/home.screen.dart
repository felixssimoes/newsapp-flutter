import 'package:flutter/material.dart';
import 'package:newsapp/app/navigator.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/models/article.model.dart';
import 'package:newsapp/data/providers/news.provider.dart';
import 'package:newsapp/ui/widgets/adaptive_refreshable_sliver.dart';
import 'package:newsapp/ui/widgets/home/category_group.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _navigator = locator<AppNavigator>();
  bool _loading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadHeadlines());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('News'),
      ),
      body: _buildScreenContent(),
    );
  }

  Widget _buildScreenContent() {
    if (_loading) return _buildLoading();
    return _buildCategoriesList();
  }

  Widget _buildCategoriesList() {
    return Consumer<NewsProvider>(
      builder: (BuildContext context, NewsProvider provider, Widget child) {
        return AdaptiveRefreshableSliver(
          onRefresh: () async => await _onPullToRefresh(provider),
          slivers: <Widget>[
            _buildCategoriesSliver(provider),
            _buildFooterSliver()
          ],
        );
      },
    );
  }

  SliverList _buildCategoriesSliver(NewsProvider provider) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final categoryProvider = provider.categoriesProviders[index];
          return ChangeNotifierProvider.value(
            value: categoryProvider,
            child: CategoryGroup(
              onPressViewAll: () =>
                  _onPressViewAll(categoryProvider.categoryName),
              onPressArticle: _onPressArticle,
            ),
          );
        },
        childCount: provider.categoriesProviders.length,
      ),
    );
  }

  SliverToBoxAdapter _buildFooterSliver() {
    return SliverToBoxAdapter(
      child: SafeArea(child: Container()),
    );
  }

  Future _onPullToRefresh(NewsProvider provider) async {
    await Future.delayed(Duration(seconds: 1));
    await provider.loadAllCategories();
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  void _loadHeadlines() async {
    this.setState(() => _loading = true);

    await locator<NewsProvider>().loadAllCategories();
    this.setState(() => _loading = false);
  }

  void _onPressViewAll(String categoryName) {
    _navigator.openCategoryScreen(categoryName);
  }

  void _onPressArticle(Article article) {
    _navigator.openArticleScreen(article);
  }
}
