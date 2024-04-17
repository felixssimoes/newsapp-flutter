import 'package:flutter/material.dart';
import 'package:newsapp/core/l10n.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No articles found.\n\nPlease select one or more sources.'.hardcoded,
        textAlign: TextAlign.center,
      ),
    );
  }
}
