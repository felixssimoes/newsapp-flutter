import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/sources/presentation/widgets/category_source_icon.dart';
import 'package:newsapp/sources/presentation/widgets/source_following_button.dart';
import 'package:newsapp/sources/sources.dart';

class SourceDetailsHeader extends StatelessWidget {
  const SourceDetailsHeader({
    super.key,
    required this.source,
  });

  final Source source;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategorySourceIcon(
                  source: source,
                  size: 104,
                ),
                Space.m,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        source.description,
                        style: TextStyles.poppinsRegular.copyWith(
                          fontSize: 12,
                          color: AppColors.blueyGrey,
                        ),
                      ),
                      Space.m,
                      SourceFollowingButton(source: source),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
