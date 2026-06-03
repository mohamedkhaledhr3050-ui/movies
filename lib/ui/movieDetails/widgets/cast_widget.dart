import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/movies_response/Movie.dart';

class CastWidget extends StatelessWidget {
  final Cast cast;

  const CastWidget({super.key, required this.cast});

  Widget _placeholder() {
    return Container(
      width: 70.w,
      height: 70.h,
      color: Colors.grey,
      child: Icon(Icons.person, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: cast.urlSmallImage != null && cast.urlSmallImage!.isNotEmpty
                ? Image.network(
                    cast.urlSmallImage ?? "",
                    width: 70.w,
                    height: 70.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _placeholder(),
                  )
                : _placeholder(),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${cast.name ?? 'Unknown'}",
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Character : ${cast.characterName ?? 'Unknown'}",
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, //
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
