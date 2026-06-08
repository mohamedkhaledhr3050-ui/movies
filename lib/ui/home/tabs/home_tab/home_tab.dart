import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/DI/di.dart';
import 'package:movies/core/resources/app_constants.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/ui/home/tabs/home_tab/movieStates/movie_list_states.dart';
import 'package:movies/ui/home/tabs/home_tab/viewModel/movie_list_view_model.dart';
import 'package:movies/ui/home/tabs/home_tab/viewModel/movie_page_view_model.dart';
import 'package:movies/ui/home/tabs/home_tab/widgets/movie_item.dart';
import 'package:movies/ui/home/tabs/home_tab/widgets/movie_section.dart';

import '../../../../data/model/movies_response/Movie.dart';
import 'movieStates/movie_page_states.dart';

class HomeTab extends StatefulWidget {
  final Function(int) goToExplore;
  const HomeTab({super.key, required this.goToExplore});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late PageController controller;
  int selectedIndex = 0;

  @override
  void initState() {
    controller = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _goToDetailsScreen(Movie movie){
    Navigator.pushNamed(context, RoutesManager.details, arguments: movie);
  }


  void _handleSeeMore(String genreName) {
    // استخدم الماب اللي عندك في الـ AppConstants عشان تجيب الـ ID
    int? id = AppConstants.movieGenres[genreName];
    if (id != null) {
      widget.goToExplore(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 645.h,
            child: BlocProvider(
              create: (context) =>
                  getIt.get<MoviePageViewModel>()..getMoviePage(),
              child: BlocBuilder<MoviePageViewModel, MoviePageStates>(
                builder: (context, state) {
                  switch (state) {
                    case MoviePageLoadingState():
                      {
                        return Center(child: CircularProgressIndicator());
                      }
                    case MoviePageErrorState():
                      {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.message,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<MoviePageViewModel>()
                                    .getMoviePage();
                              },
                              child: Text("Try Again"),
                            ),
                          ],
                        );
                      }
                    case MoviePageSuccessState():
                      List<Movie> movies = state.movies;
                      return Stack(
                        children: [
                          Image.network(
                            movies.isNotEmpty
                                ? movies[selectedIndex].largeCoverImage ?? ''
                                : '',
                            width: double.infinity,
                            height: 645.h,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: double.infinity,
                            height: 645.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Theme.of(context).colorScheme.secondary
                                      .withValues(alpha: 0.8),
                                  Theme.of(context).colorScheme.secondary
                                      .withValues(alpha: 0.6),
                                  Theme.of(context).colorScheme.secondary
                                      .withValues(alpha: 1.0),
                                ],
                                stops: const [0.8, 0.6, 1.0],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                SafeArea(
                                  bottom: false,
                                  child: Image.asset(
                                    AssetsManager.availableNow,
                                    width: 267.w,
                                    height: 93.h,
                                  ),
                                ),
                                Expanded(
                                  child: PageView.builder(
                                    onPageChanged: (value) {
                                      setState(() {
                                        selectedIndex = value;
                                      });
                                    },
                                    itemBuilder: (context, index) => MovieItem(
                                      onTap: () => _goToDetailsScreen(movies[index]),
                                      movie: movies[index],
                                      index: index,
                                      selectedIndex: selectedIndex,
                                    ),
                                    itemCount: movies.length,
                                    controller: controller,
                                  ),
                                ),
                                Image.asset(
                                  AssetsManager.watchNow,
                                  width: 354.w,
                                  height: 146.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                  }
                },
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: REdgeInsets.all(16),
            child: BlocProvider(
              create: (context) =>
                  getIt.get<MovieListViewModel>()..getMoviesByGenre(),
              child: BlocBuilder<MovieListViewModel, MovieListStates>(
                builder: (context, state) {
                  switch (state) {
                    case MovieListInitialState():
                      return const SizedBox.shrink();

                    case MovieListLoadingState():
                      return SizedBox(
                        height: 300.h,
                        child: const Center(child: CircularProgressIndicator()),
                      );

                    case MovieListErrorState():
                      return SizedBox(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.message,
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<MovieListViewModel>()
                                    .getMoviesByGenre();
                              },
                              child: const Text("Try Again"),
                            ),
                          ],
                        ),
                      );

                    case MovieListSuccessState():
                      return Column(
                        children: [
                          MovieSection(
                            onMovieSelected: (movie) => _goToDetailsScreen(movie) ,
                            title: state.title1,
                            movies: state.movies1,
                            onSeeMorePressed:()=> _handleSeeMore(state.title1)
                          ),

                          SizedBox(height: 24.h),
                          MovieSection(
                            onMovieSelected: (movie) => _goToDetailsScreen(movie) ,
                            title: state.title2,
                            movies: state.movies2,
                              onSeeMorePressed:()=> _handleSeeMore(state.title2)
                          ),

                          SizedBox(height: 24.h),
                          MovieSection(
                            onMovieSelected: (movie) => _goToDetailsScreen(movie) ,
                            title: state.title3,
                            movies: state.movies3,
                              onSeeMorePressed:()=> _handleSeeMore(state.title3)
                          ),
                          SizedBox(height: 90.h),
                        ],
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
