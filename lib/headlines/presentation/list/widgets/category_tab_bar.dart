import 'package:flutter/material.dart';
import 'package:newsapp/articles/articles.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/core/utils.dart';

const kCategoryTabBarHeight = 52.0;

class CategoryTabBar extends StatefulWidget {
  const CategoryTabBar({
    this.onCategorySelected,
    super.key,
  });

  final ValueChanged<String>? onCategorySelected;

  @override
  State<CategoryTabBar> createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  int _selectedIndex = 0;

  static final _tabItems = kCategories.map((category) {
    return _TabItem(
      category: category,
      index: kCategories.indexOf(category),
      isSelected: false,
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kCategoryTabBarHeight,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: _tabItems
            .map((tabItem) => CategoryTab(
                  tabItem: tabItem,
                  isSelected: tabItem.index == _selectedIndex,
                  onTap: () {
                    setState(() => _selectedIndex = tabItem.index);
                    if (widget.onCategorySelected != null) {
                      widget.onCategorySelected!(tabItem.category);
                    }
                  },
                ))
            .toList(),
      ),
    );
  }
}

class _TabItem {
  _TabItem({
    required this.category,
    required this.index,
    required this.isSelected,
  });

  final String category;
  final int index;
  final bool isSelected;
  final GlobalKey itemKey = GlobalKey();
}

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    required this.tabItem,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final _TabItem tabItem;
  final bool isSelected;
  final VoidCallback onTap;

  static final _highlightTextStyle = TextStyles.poppinsBold.copyWith(
    fontSize: 14,
    color: AppColors.dark,
    height: 1.6,
  );

  static final _normalTextStyle = TextStyles.poppinsRegular.copyWith(
    fontSize: 14,
    color: AppColors.battleshipGrey,
    height: 1.6,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: tabItem.itemKey,
      onTap: () {
        onTap();
        if (tabItem.itemKey.currentContext != null) {
          Scrollable.ensureVisible(
            tabItem.itemKey.currentContext!,
            duration: Durations.medium1,
            curve: Curves.easeInOut,
            alignment: 0.5,
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.paleGrey : AppColors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 15,
        ),
        child: Text(
          tabItem.category.capitalize().hardcoded,
          style: isSelected ? _highlightTextStyle : _normalTextStyle,
        ),
      ),
    );
  }
}
