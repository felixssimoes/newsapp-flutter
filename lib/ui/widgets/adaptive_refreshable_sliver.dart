import 'dart:io';

import 'package:flutter/cupertino.dart' hide RefreshCallback;
import 'package:flutter/material.dart';

class AdaptiveRefreshableSliver extends StatelessWidget {
  final RefreshCallback onRefresh;
  final List<Widget> slivers;

  const AdaptiveRefreshableSliver({
    Key key,
    this.onRefresh,
    this.slivers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || onRefresh == null) return _buildList(context);

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        if (Platform.isIOS && onRefresh != null)
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
        ...slivers,
      ],
    );
  }
}
