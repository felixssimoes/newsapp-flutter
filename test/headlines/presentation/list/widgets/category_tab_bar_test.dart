import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/utils.dart';
import 'package:newsapp/headlines/presentation/list/widgets/category_tab_bar.dart';

import '../../../../_helpers/widgets.dart';

class ValueChangedMock<T> extends Mock {
  void call(T value);
}

void main() {
  group('CategoryTabBar', () {
    testWidgets('intialization', (tester) async {
      final onCategorySelected = ValueChangedMock<String>();
      await tester.pumpWidget(wrapWithMaterialApp(CategoryTabBar(
        onCategorySelected: onCategorySelected.call,
      )));

      for (final category in kCategories) {
        final finder = find.text(
          category.capitalize().hardcoded,
          skipOffstage: false,
        );
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        verify(onCategorySelected.call(category)).called(1);
      }

      verifyNoMoreInteractions(onCategorySelected);
    });
  });
}
