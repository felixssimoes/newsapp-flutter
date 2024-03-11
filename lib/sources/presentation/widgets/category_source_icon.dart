import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/data/api/api_client.dart';
import 'package:newsapp/core/presentation.dart';

class CategorySourceIcon extends StatelessWidget {
  const CategorySourceIcon({
    required this.source,
    required this.size,
    super.key,
  });

  final Source source;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(104 / 2),
        border: Border.all(
          color: AppColors.lightPeriwinkle,
          width: 1,
        ),
      ),
      child: ClipRRect(
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
      ),
    );
  }
}
