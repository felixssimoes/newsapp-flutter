import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/data/api/api_client.dart';
import 'package:newsapp/core/presentation.dart';

class CategorySourceIconPreview extends StatelessWidget {
  const CategorySourceIconPreview({
    required this.source,
    required this.size,
    super.key,
  });

  final Source source;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Image.network(
        UrlBuilder.uriForSourceLogo(source.url).toString(),
        width: size,
        height: size,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.error,
          size: size / 2,
          color: AppColors.fadedRed,
        ),
      ),
    );
  }
}
