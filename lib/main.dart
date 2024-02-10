import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/presentation.dart';

void main() {
  runApp(const ProviderScope(child: NewsApp()));
}
