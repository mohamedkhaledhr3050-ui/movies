import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/assets_manager.dart';
import '../../../../../data/model/movies_response/Movie.dart';

class MovieItem extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final Movie movie;
  final VoidCallback onTap;

  const MovieItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.movie,
    required this.onTap
  });

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            alignment: Alignment.center,
            margin: REdgeInsets.symmetric(
                horizontal: 24,
                vertical: widget.selectedIndex == widget.index ? 0 : 30
            ),
            width: 234.w,
            height: 351.h,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.network(
                    widget.movie.largeCoverImage ?? "",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[900],
                      child: const Icon(Icons.broken_image, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: REdgeInsets.only(left: 9, top: 11),
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
                        widget.movie.rating?.toStringAsFixed(1) ?? '0.0',
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
          ),
        ),
      ),
    );
  }
}