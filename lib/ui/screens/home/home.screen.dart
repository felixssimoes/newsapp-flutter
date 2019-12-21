import 'package:flutter/material.dart';
import 'package:newsapp/config/locator.config.dart';
import 'package:newsapp/data/providers/news.provider.dart';
import 'package:newsapp/ui/widgets/home/category_group.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = false;

  @override
  void initState() {
    _loadHeadlines();
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
      builder: (BuildContext context, NewsProvider provider, Widget child) =>
          ListView(
        children: provider.categories
            .map((category) => CategoryGroup(category: category))
            .toList(),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  void _loadHeadlines() async {
    this.setState(() => _loading = true);
    await locator<NewsProvider>().loadAllCategories();
    this.setState(() => _loading = false);
  }
}
