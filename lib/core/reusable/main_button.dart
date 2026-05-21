import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final void Function() onClick;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? icon;

  const MainButton({
    super.key,
    required this.onClick,
    required this.title,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: REdgeInsets.symmetric(vertical: 14.49),
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15.r),
          ),
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: 1.w)
              : BorderSide.none,
          elevation: 0,
        ),
        onPressed: onClick,
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 26.56.w, height: 26.56.h, child: icon!),
                  SizedBox(width: 10.w),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color:
                          textColor ??
                          (backgroundColor == Colors.transparent
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color:
                      textColor ??
                      (backgroundColor == Colors.transparent
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary),
                ),
              ),
      ),
    );
  }
}
