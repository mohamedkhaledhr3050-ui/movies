import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/DI/di.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/core/resources/strings_manager.dart';
import 'package:movies/core/reusable/main_button.dart';
import 'package:movies/ui/home/tabs/home_tab/widgets/movie_list_item.dart';
import 'package:movies/ui/movieDetails/movieDetailsStates/movie_details_states.dart';
import 'package:movies/ui/movieDetails/viewModel/movie_details_view_model.dart';
import 'package:movies/ui/movieDetails/widgets/cast_widget.dart';
import 'package:movies/ui/movieDetails/widgets/movie_info_badge.dart';

import '../../../data/model/movies_response/Movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt.get<MovieDetailsViewModel>()
              ..getMovieDetails(movie.id!.toInt()),
        child: BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
          builder: (context, state) {
            switch (state) {
              case MovieDetailsInitialState():
                return const SizedBox.shrink();

              case MovieDetailsLoadingState():
                return Center(child: CircularProgressIndicator());

              case MovieDetailsErrorState():
                return Column(
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
                        context.read<MovieDetailsViewModel>().getMovieDetails(
                          movie.id!.toInt(),
                        );
                      },
                      child: const Text("Try Again"),
                    ),
                  ],
                );

              case MovieDetailsSuccessState():
                final detailedMovie = state.movie;
                return Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 766.h,
                            width: double.infinity,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  height: 766.h,
                                  child: Image.network(
                                    detailedMovie.largeCoverImage ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 766.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Theme.of(context).colorScheme.secondary
                                            .withValues(alpha: 0.6),
                                        Colors.transparent,
                                        Theme.of(context).colorScheme.secondary
                                            .withValues(alpha: 0.7),
                                        Theme.of(context).colorScheme.secondary,
                                      ],
                                      stops: const [0.0, 0.25, 0.55, 1.0],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    AssetsManager.play,
                                    width: 97.w,
                                    height: 97.h,
                                  ),
                                ),
                                Padding(
                                  padding: REdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        detailedMovie.title ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 15.h),
                                      Text(
                                        detailedMovie.year.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.sp,
                                              color: const Color(0xffADADAD),
                                            ),
                                      ),
                                      SizedBox(height: 8.h),
                                      SizedBox(height: 16.h),
                                      MainButton(
                                        onClick: () {},
                                        title: StringsManager.watch,
                                        backgroundColor: ColorsManager.chiliRed,
                                        textColor: ColorsManager.white,
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MovieInfoBadge(
                                            icon: AssetsManager.heart,
                                            value: detailedMovie.likeCount
                                                .toString(),
                                          ),
                                          MovieInfoBadge(
                                            icon: AssetsManager.time,
                                            value:
                                                "${detailedMovie.runtime ?? 0}",
                                          ),
                                          MovieInfoBadge(
                                            icon: AssetsManager.star1,
                                            value:
                                                detailedMovie.rating
                                                    ?.toStringAsFixed(1) ??
                                                "0.0",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: REdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringsManager.screenShots,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.sp,
                                      ),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    List<String> screenshots = [
                                      detailedMovie.largeScreenshotImage1 ??
                                          detailedMovie
                                              .mediumScreenshotImage1 ??
                                          "",
                                      detailedMovie.largeScreenshotImage2 ??
                                          detailedMovie
                                              .mediumScreenshotImage2 ??
                                          "",
                                      detailedMovie.largeScreenshotImage3 ??
                                          detailedMovie
                                              .mediumScreenshotImage3 ??
                                          "",
                                    ];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: Image.network(
                                        screenshots[index],
                                        width: double.infinity,
                                        height: 165.h,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 13.h),
                                  itemCount: 3,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  StringsManager.similar,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.sp,
                                      ),
                                ),
                                SizedBox(height: 11.h),
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.similarMovies.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16.w,
                                        mainAxisSpacing: 16.h,
                                        mainAxisExtent: 280.h,
                                      ),
                                  itemBuilder: (context, index) {
                                    final similarMovies =
                                        state.similarMovies[index];
                                    return MovieListItem(
                                      movie: similarMovies,
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          RoutesManager.details,
                                          arguments: similarMovies,
                                        );
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  StringsManager.summary,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.sp,
                                      ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  detailedMovie.descriptionFull ??
                                      "No Summary Available",
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(fontSize: 16.sp),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  StringsManager.cast,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.sp,
                                      ),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 8.h),
                                  itemBuilder: (context, index) {
                                    final currentCast =
                                        state.movie.cast![index];
                                    return CastWidget(cast: currentCast);
                                  },
                                  itemCount: state.movie.cast?.length ?? 0,
                                ),

                                SizedBox(height: 20.h),
                                Text(
                                  StringsManager.genres,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.sp,
                                      ),
                                ),
                                Wrap(
                                  spacing: 16.w,
                                  runSpacing: 11.h,
                                  children: [
                                    if(detailedMovie.genres!= null)
                                      for(var genre in detailedMovie.genres!)
                                        IntrinsicWidth(
                                          child: MovieInfoBadge(value: genre,),
                                        )

                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SafeArea(
                      child: Padding(
                        padding: REdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: SvgPicture.asset(
                                AssetsManager.arrowBackIos,
                                width: 17.w,
                                height: 29.h,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                AssetsManager.bookMark,
                                width: 20.w,
                                height: 29.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}

/*
Text(
                                  StringsManager.summary,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24.sp,
                                      ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  detailedMovie.descriptionFull ?? "",
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(fontSize: 16.sp),
                                ),
                                SizedBox(height: 50.h),
* */
