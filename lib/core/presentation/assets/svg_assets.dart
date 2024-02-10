const _kAssetsRoot = 'assets/svg';

const _kApp = '$_kAssetsRoot/app';

enum SvgAssets {
  tabHomeIcon('$_kApp/home_tab_icon.svg'),
  tabHeadlinesIcon('$_kApp/headlines_tab_icon.svg'),
  tabFollowingIcon('$_kApp/following_tab_icon.svg'),
  tabSourcesIcon('$_kApp/sources_tab_icon.svg'),
  // ignore: unused_field
  _dummy('');

  const SvgAssets(this.filename);
  final String filename;
}
