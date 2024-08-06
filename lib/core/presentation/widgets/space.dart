import 'package:flutter/material.dart';

@immutable
class Space extends StatelessWidget {
  const Space({
    required this.size,
    super.key,
  });

  static const Space xs = Space(size: 4.0);
  static const Space s = Space(size: 8.0);
  static const Space m = Space(size: 16.0);
  static const Space l = Space(size: 32.0);
  static const Space xl = Space(size: 64.0);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
