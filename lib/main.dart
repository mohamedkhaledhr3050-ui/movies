import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/remote/local/sharedPrefs/prefs_manager.dart';
import 'package:movies/core/resources/app_theme.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/ui/Auth/forgetPassword/screen/forget_password.dart';
import 'package:movies/ui/Auth/login/screen/login_screen.dart';
import 'package:movies/ui/Auth/register/screen/register_screen.dart';
import 'package:movies/ui/home/screen/home_screen.dart';
import 'package:movies/ui/movieDetails/screen/movie_details.dart';
import 'package:movies/ui/onBoarding/on_boarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/DI/di.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // تأكد إن ملف الـ firebase_options متولد عندك
  );
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
          initialRoute: RoutesManager.home,
          routes: {
            RoutesManager.onBoarding: (_)=> OnBoardingScreen(),
            RoutesManager.login:(_)=> LoginScreen(),
            RoutesManager.register:(_)=> RegisterScreen(),
            RoutesManager.forgetPass:(_)=> ForgetPassword(),
            RoutesManager.home:(_)=> HomeScreen(),
            RoutesManager.details:(_)=> MovieDetails(),
          },
        );
      },
    );
  }
}
