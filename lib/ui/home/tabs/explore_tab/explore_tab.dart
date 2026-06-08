import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/ui/home/tabs/explore_tab/widgets/movie_list_by_genre.dart';

class ExploreTab extends StatelessWidget {
  final TabController controller;
  ExploreTab({super.key, required this.controller});


  final List<String> genreNames = AppConstants.movieGenres.keys.toList();

  final List<int> genreIds = AppConstants.movieGenres.values.toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          children: [
            TabBar(
              labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700
              ),
              controller: controller,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.transparent,
              labelColor: Theme.of(context).colorScheme.secondary,
              unselectedLabelColor: Theme.of(context).colorScheme.primary,
              labelPadding: REdgeInsets.symmetric(horizontal: 8),
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: Theme.of(context).colorScheme.primary)
              ),


              tabs: genreNames.map((genre){
                return Tab(
                  child: Container(
                    padding: REdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary
                      )
                    ),
                    child: Text(genre),
                  ),
                );
              },).toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: genreIds.map((id) {
                  return MovieListByGenre(genreId: id);
                },).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
