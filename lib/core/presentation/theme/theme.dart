import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/presentation.dart';

export 'app_colors.dart';
export 'text_styles.dart';

ThemeData appTheme(BuildContext context) {
  final theme = Theme.of(context).copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.camo,
      secondary: AppColors.orangish,
      error: AppColors.fadedRed,
    ),
  );
  if (kIsWeb || Platform.isAndroid) {
    return theme;
  }
  return theme.copyWith(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
  );
}
