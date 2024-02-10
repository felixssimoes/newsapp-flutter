import 'package:flutter/material.dart';
import 'package:newsapp/core/presentation.dart';

class NewsAppBar extends StatelessWidget {
  const NewsAppBar({
    required this.title,
    this.bottom,
    super.key,
  });

  final String title;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        title,
        style: TextStyles.ibmPlexSerifSemiBold.copyWith(fontSize: 20),
      ),
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      floating: true,
      snap: true,
      pinned: true,
      bottom: bottom ??
          PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              width: double.infinity,
              height: 1,
              color: AppColors.paleGrey,
            ),
          ),
    );
  }
}
