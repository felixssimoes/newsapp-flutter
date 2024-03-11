import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/sources/sources.dart';

class SourceFollowingButton extends ConsumerStatefulWidget {
  const SourceFollowingButton({
    required this.source,
    super.key,
  });

  final Source source;

  @override
  ConsumerState<SourceFollowingButton> createState() =>
      _CategoryFollowingButtonState();
}

class _CategoryFollowingButtonState
    extends ConsumerState<SourceFollowingButton> {
  var isFollowing = false;

  @override
  void initState() {
    super.initState();
    ref
        .read(isFollowingSourceProvider(sourceId: widget.source.id))
        .whenData((value) => setState(() => isFollowing = value));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      isFollowingSourceProvider(sourceId: widget.source.id),
      (_, c) => c.whenData((value) => setState(() => isFollowing = value)),
    );
    return TextButton(
      onPressed: () {
        isFollowing
            ? ref.read(sourcesServiceProvider).unfollowSource(widget.source)
            : ref.read(sourcesServiceProvider).followSource(widget.source);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: isFollowing ? AppColors.camo : AppColors.paleGrey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          isFollowing ? 'Unfollow'.hardcoded : 'Follow'.hardcoded,
          style: TextStyles.poppinsRegular.copyWith(
            color: isFollowing ? AppColors.white : AppColors.slateGrey,
            fontSize: 12,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
