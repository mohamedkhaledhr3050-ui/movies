import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class MovieInfoBadge extends StatelessWidget {
  final String? icon;
  final String? value;
  const MovieInfoBadge({super.key, this.icon , this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 11, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Theme.of(context).colorScheme.onTertiary
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(icon != null && icon!.isNotEmpty) ...[
            SvgPicture.asset(icon??"", width: 30.w, height: 28.w,),
            SizedBox(width: 14.w),
          ],

          Text(value??"", style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),)
        ],
      ),
    );
  }
}
