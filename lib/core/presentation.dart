import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'presentation/navigation/app_router.dart';

export 'presentation/app/news.app.dart';
export 'presentation/assets/assets.dart';
export 'presentation/navigation/app_router.dart';
export 'presentation/theme/theme.dart';
export 'presentation/widgets/widgets.dart';

part 'presentation.g.dart';

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
