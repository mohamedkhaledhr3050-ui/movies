import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWidget extends StatelessWidget {
  final String imagePath;
  final double size;
  final bool isCenter;

  const AvatarWidget({
    required this.imagePath,
    required this.size,
    this.isCenter = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // البوردر الأصفر والـ Shadow بيشتغلوا بس للأفاتار اللي في النص
        border: isCenter
            ? Border.all(color: const Color(0xFFF6BD00), width: 3.w)
            : null,
        boxShadow: isCenter
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}