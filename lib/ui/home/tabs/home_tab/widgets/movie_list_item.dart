import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../data/model/movies_response/Movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieListItem({
    required this.movie,
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.network(
            movie.largeCoverImage??movie.mediumCoverImage??movie.smallCoverImage??"",
              errorBuilder: (context, error, stackTrace){
                return Container(
                  color: Colors.grey[900],
                  child: const Center(child: Icon(Icons.broken_image, color: Colors.white)),
                );
              },
            ),
          ),
          Container(
            margin: REdgeInsets.only(left: 14, top: 13),
            padding: REdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.71),
                borderRadius: BorderRadius.circular(10.r)
            ),
            child: Row(
              spacing: 3,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.rating?.toStringAsFixed(1) ?? '0.0',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 16.sp
                  ),
                ),
                Image.asset(AssetsManager.star, width: 15.w, height: 15.h,)
              ],
            ),
          )
        ],
      ),
    );
  }
}