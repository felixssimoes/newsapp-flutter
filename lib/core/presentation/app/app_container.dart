import 'package:flutter/material.dart';
import 'package:newsapp/core/l10n.dart';
import 'package:newsapp/core/presentation.dart';
import 'package:newsapp/headlines/headlines.dart';
import 'package:newsapp/home/home.dart';
import 'package:newsapp/sources/sources.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int _selectedIndex = 0;

  static final _labelStyle = TextStyles.poppinsBold.copyWith(fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                const HomeListScreen(),
                const HeadlinesListScreen(),
                Center(child: Text('Following'.hardcoded)),
                const SourcesListScreen(),
              ],
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blueyGrey.withOpacity(0.1),
            blurRadius: 10.0,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(6.0),
          topRight: Radius.circular(6.0),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() => _selectedIndex = value),
        showUnselectedLabels: true,
        selectedLabelStyle: _labelStyle,
        unselectedLabelStyle: _labelStyle,
        selectedItemColor: AppColors.camo,
        unselectedItemColor: AppColors.slateGrey,
        iconSize: 24.0,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildTabItem(
            iconAsset: SvgAssets.tabHomeIcon,
            label: 'For you'.hardcoded,
            isSelected: _selectedIndex == 0,
          ),
          _buildTabItem(
            iconAsset: SvgAssets.tabHeadlinesIcon,
            label: 'Headlines'.hardcoded,
            isSelected: _selectedIndex == 1,
          ),
          _buildTabItem(
            iconAsset: SvgAssets.tabFollowingIcon,
            label: 'Following'.hardcoded,
            isSelected: _selectedIndex == 2,
          ),
          _buildTabItem(
            iconAsset: SvgAssets.tabSourcesIcon,
            label: 'Sources'.hardcoded,
            isSelected: _selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildTabItem({
    required SvgAssets iconAsset,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SvgImage(
          iconAsset,
          height: 24,
          width: 24,
          color: isSelected ? AppColors.camo : AppColors.slateGrey,
        ),
      ),
      label: label,
    );
  }
}
