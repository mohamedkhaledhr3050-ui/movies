import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';

class CustomField extends StatefulWidget {
  final String? hint;
  final String? prefix;
  String? suffix;
  bool isObscure;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  TextEditingController? controller;
  CustomField({super.key, this.hint, this.prefix, this.suffix, this.isObscure = false, this.validator, this.controller, this.onChanged});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
      obscureText:widget.isObscure? !isVisible : false ,
      style: TextStyle(
        color: ColorsManager.white
      ),
      decoration: InputDecoration(
        prefixIcon:(widget.prefix != null && widget.prefix!.isNotEmpty)? Padding(
          padding: REdgeInsets.only(left: 19 , right: 5),
          child: SvgPicture.asset(widget.prefix!, width: 31.w, height: 25.h,),
        ): null,
        prefixIconConstraints: BoxConstraints(
          minWidth: 50.w,
          maxWidth: 50.w,
          minHeight: 50.h,
          maxHeight: 50.h
        ),
        suffixIcon: widget.isObscure
            ? IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: SvgPicture.asset(
            width: 30.w,
            height: 30.h,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            isVisible
                ? AssetsManager.visibleOn
                : AssetsManager.visibleOff,
          ),
        )
            : widget.suffix != null
            ? SvgPicture.asset(widget.suffix!)
            : null,

        hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontSize: 16.sp
        ),
        hintText: widget.hint,
        filled: true,
        fillColor: Theme.of(context).colorScheme.onTertiary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}
