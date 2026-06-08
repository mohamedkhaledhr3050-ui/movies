import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/ui/home/tabs/explore_tab/explore_tab.dart';
import 'package:movies/ui/home/tabs/home_tab/home_tab.dart';
import 'package:movies/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:movies/ui/home/tabs/search_tab/search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int currentIndex = 0;
  late List<Widget> screens;

  @override
  void initState() {
    _controller = TabController(
      length: AppConstants.movieGenres.length,
      vsync: this,
    );
    screens = [
      HomeTab(goToExplore: (id) => goToExplore(id)),
      SearchTab(),
      ExploreTab(controller: _controller),
      ProfileTab(),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToExplore(int genreId) {
    int index = AppConstants.movieGenres.values.toList().indexOf(genreId);
    if (index != -1) {
      setState(() => currentIndex = 2);
      _controller.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: REdgeInsets.only(left: 9, right: 9, bottom: 9),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0
                    ? SvgPicture.asset(AssetsManager.homeSelected)
                    : SvgPicture.asset(AssetsManager.home),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1
                    ? SvgPicture.asset(AssetsManager.searchSelected)
                    : SvgPicture.asset(AssetsManager.search),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? SvgPicture.asset(AssetsManager.exploreSelected)
                    : SvgPicture.asset(AssetsManager.explore),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 3
                    ? SvgPicture.asset(AssetsManager.profileSelected)
                    : SvgPicture.asset(AssetsManager.profile),
                label: "",
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      )
    );
  }
}
