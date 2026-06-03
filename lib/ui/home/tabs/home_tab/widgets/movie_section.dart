import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/resources/assets_manager.dart';

import '../../../../../core/resources/strings_manager.dart';
import '../../../../../data/model/movies_response/Movie.dart';
import 'movie_list_item.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<Movie>movies;
  final Function(Movie) onMovieSelected;
  const MovieSection({super.key, required this.title, required this.movies, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    StringsManager.seeMore,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SvgPicture.asset(AssetsManager.arrowRight),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 220.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              final currentMovie = movies[index];
              return MovieListItem(movie: movies[index], onTap:() {
                onMovieSelected(currentMovie);
              },);
            },
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemCount: movies.length,
          ),
        ),
      ],
    );
  }
}