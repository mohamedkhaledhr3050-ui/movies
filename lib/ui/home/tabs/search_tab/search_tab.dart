import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/DI/di.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/core/resources/strings_manager.dart';
import 'package:movies/core/reusable/custom_field.dart';
import 'package:movies/data/model/movies_response/Movie.dart';
import 'package:movies/ui/home/tabs/home_tab/widgets/movie_list_item.dart';
import 'package:movies/ui/home/tabs/search_tab/searchStates/search_states.dart';
import 'package:movies/ui/home/tabs/search_tab/searchViewModel/search_view_model.dart';

class SearchTab extends StatelessWidget {
  String searchQuery = "";

  SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SearchViewModel>(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  CustomField(
                    hint: StringsManager.search,
                    prefix: AssetsManager.search,
                    onChanged: (query) {
                      searchQuery = query;
                      context.read<SearchViewModel>().searchMovies(query);
                    },
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: BlocBuilder<SearchViewModel, SearchStates>(
                      builder: (context, state) {
                        switch (state) {
                          case SearchInitialState():
                            return Center(
                              child: Image.asset(
                                AssetsManager.emptySearch,
                                width: 124.w,
                                height: 124.h,
                                fit: BoxFit.cover,
                              ),
                            );

                          case SearchLoadingState():
                            return const Center(
                              child: CircularProgressIndicator(),
                            );

                          case SearchErrorState():
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.message,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 16.h),
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<SearchViewModel>()
                                        .searchMovies(searchQuery);
                                  },
                                  child: const Text("Try Again"),
                                ),
                              ],
                            );

                          case SearchEmptyState():
                            return Center(
                              child: Image.asset(
                                AssetsManager.emptySearch,
                                width: 124.w,
                                height: 124.h,
                                fit: BoxFit.cover,
                              ),
                            );

                          case SearchSuccessState():
                            List<Movie> movie = state.movies;
                            return GridView.builder(
                              itemCount: movie.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 8.h,
                                    childAspectRatio: 0.7,
                                  ),
                              itemBuilder: (context, index) {
                                return MovieListItem(
                                  movie: movie[index],
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesManager.details,
                                      arguments: movie[index],
                                    );
                                  },
                                );
                              },
                            );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
