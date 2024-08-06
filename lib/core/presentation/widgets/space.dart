import 'package:flutter/material.dart';

@immutable
class Space extends StatelessWidget {
  const Space({
    required this.size,
    super.key,
  });

  factory Space.xs() => const Space(size: 4.0);
  factory Space.s() => const Space(size: 8.0);
  factory Space.m() => const Space(size: 16.0);
  factory Space.l() => const Space(size: 32.0);
  factory Space.xl() => const Space(size: 64.0);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
