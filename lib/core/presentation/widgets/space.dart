import 'package:flutter/material.dart';

@immutable
class Space extends StatelessWidget {
  final double? _width;
  final double? _height;

  const Space.horizontal(double size, {super.key})
      : _width = size,
        _height = null;

  const Space.vertical(double size, {super.key})
      : _height = size,
        _width = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
    );
  }
}
