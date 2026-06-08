import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/DI/di.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/ui/home/tabs/explore_tab/exploreStates/explore_states.dart';
import 'package:movies/ui/home/tabs/explore_tab/exploreViewModel/explore_view_model.dart';
import 'package:movies/ui/home/tabs/home_tab/widgets/movie_list_item.dart';

class MovieListByGenre extends StatelessWidget {
  final int genreId;
  const MovieListByGenre({super.key, required this.genreId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ExploreViewModel>()..getMoviesByGenre(genreId),
      child: BlocBuilder<ExploreViewModel, ExploreStates>(
        builder: (context, state) {
          return switch(state){
            ExploreInitialState() || ExploreLoadingState() =>
            const Center(child: CircularProgressIndicator()),

            ExploreErrorState(message: var msg) =>
                Center(child: Text(msg, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorsManager.primary
                ),)),

            ExploreEmptyState() => Center(child: Text("No movies available in this genre.",style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorsManager.primary
            ),)),

            ExploreSuccessState(movies: var movies) => GridView.builder(
                padding: REdgeInsets.all(16),
                itemCount: movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 0.7,
                ),

                itemBuilder: (context, index) {
                  return MovieListItem(movie: movies[index], onTap: (){
                    Navigator.pushNamed(context, RoutesManager.details, arguments: movies[index]);
                  });
                },
            )};
        },
      ),
    );
  }
}
