import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/app_theme.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/ui/Auth/login/screen/login_screen.dart';
import 'package:movies/ui/onBoarding/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movies App',
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesManager.login,
          routes: {
            RoutesManager.onBoarding: (_)=> OnBoardingScreen(),
            RoutesManager.login:(_)=> LoginScreen()
          },
        );
      },
    );
  }
}
