import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsapp/data/providers/search.provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  Timer timeHandle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildArticlesList(),
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

  Widget _buildArticlesList() {
    return Consumer<SearchProvider>(
      builder: (BuildContext context, SearchProvider provider, Widget child) {
        return ListView.builder(
          itemCount: provider.articles.length,
          itemBuilder: (_, index) {
            final article = provider.articles[index];
            return ListTile(title: Text(article.title));
          },
        );
      },
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

  Future<void> _doSearch(String value) async {
    print("Calling now the API: $value");
    SearchProvider provider = Provider.of(context, listen: false);
    await provider.loadSearchNews(text: value);
  }
}
