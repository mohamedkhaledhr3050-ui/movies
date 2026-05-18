import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/strings_manager.dart';
import 'package:movies/core/reusable/custom_field.dart';
import 'package:movies/core/reusable/main_button.dart';

class LoginScreen extends StatefulWidget {

   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(19),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(AssetsManager.logo),
                SizedBox(height: 69.h),
                CustomField(
                  hint: StringsManager.email,
                  prefix: AssetsManager.email,
                ),
                SizedBox(height: 22.h),
                CustomField(
                  hint: StringsManager.password,
                  prefix: AssetsManager.password,
                  isObscure: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      StringsManager.forgetPassword,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
                SizedBox(height: 33.h,),
                MainButton(onClick: (){}, title: StringsManager.login),
                SizedBox(height: 22.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringsManager.dontHaveAcc, style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ColorsManager.white
                    ),),
                    TextButton(onPressed: (){}, child: Text(StringsManager.createOne, style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),))
                  ],
                ),
                SizedBox(height: 27.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 110.84.w,
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                        thickness: 1.12.h,
                        endIndent: 10.w,
                      ),
                    ),
                    Text(StringsManager.or,style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 15.sp
                    ),),
                    SizedBox(
                      width: 110.84.w,
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                        thickness: 1.12.h,
                        indent: 10.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28.h,),
                MainButton(onClick: (){}, title: StringsManager.loginWithGoogle, icon: SvgPicture.asset(AssetsManager.googleIcon),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
