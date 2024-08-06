import 'package:flutter/material.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';

class HomeEmpty extends StatelessWidget {
  const HomeEmpty({
    required this.onGoToSources,
    super.key,
  });

  final VoidCallback onGoToSources;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No articles found.\n\nPlease select one or more sources.'
                .hardcoded,
            textAlign: TextAlign.center,
          ),
          Space.m,
          GenericTextButton(
            text: 'Go to News Sources'.hardcoded,
            onPressed: onGoToSources,
          ),
        ],
      ),
    );
  }
}
