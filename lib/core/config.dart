import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'config/app_config.dart';

part 'config.g.dart';

@riverpod
AppConfig appConfig(AppConfigRef ref) => AppConfig();
