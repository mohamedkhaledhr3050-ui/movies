import 'package:flutter/cupertino.dart';
import 'package:movies/core/resources/assets_manager.dart';
import 'package:movies/core/resources/strings_manager.dart';

class OnBoardingModel {
  final String img, title, desc;
  final LinearGradient gradiant;
  final String buttonText;
  final bool showBackButton;

  OnBoardingModel({
    required this.title,
    required this.buttonText,
    this.showBackButton = false,
    this.desc = "",
    required this.img,
    this.gradiant = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xffffffff), Color(0xff131213)],
    ),
  });

  static List<OnBoardingModel> model = [
    OnBoardingModel(
      title: "Find Your Next Favorite Movie Here",
      desc:
          "Get access to a huge library of movies to suit all tastes. You will surely like it.",
      img: AssetsManager.onBoarding1,
      gradiant: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff121312).withValues(alpha: 0.5),
          Color(0xff121312).withValues(alpha: 0.9),
        ],
      ),
      buttonText: StringsManager.exploreNow,
    ),
    OnBoardingModel(
      title: "Discover Movies",
      desc:
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      img: AssetsManager.onBoarding2,
      gradiant: LinearGradient(
        colors: [
          Color(0xff084250).withValues(alpha: 0.0),
          Color(0xff084250).withValues(alpha: 1.0),
        ],
      ),
      buttonText: StringsManager.next,
    ),
    OnBoardingModel(
      title: "Explore All Genres",
      desc:
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      img: AssetsManager.onBoarding3,
      gradiant: LinearGradient(
        colors: [
          Color(0xff85210E).withValues(alpha: 0.0),
          Color(0xff85210E).withValues(alpha: 1.0),
        ],
      ),
      buttonText: StringsManager.next,
      showBackButton: true,
    ),
    OnBoardingModel(
      title: "Create Watchlists",
      desc:
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      img: AssetsManager.onBoarding4,
      gradiant: LinearGradient(
        colors: [
          Color(0xff4C2471).withValues(alpha: 0.0),
          Color(0xff4C2471).withValues(alpha: 1.0),
        ],
      ),
      buttonText: StringsManager.next,
      showBackButton: true,
    ),
    OnBoardingModel(
      title: "Rate, Review, and Learn",
      desc:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      img: AssetsManager.onBoarding5,
      gradiant: LinearGradient(
        colors: [
          Color(0xff601321).withValues(alpha: 0.0),
          Color(0xff601321).withValues(alpha: 1.0),
        ],
      ),
      buttonText: StringsManager.next,
      showBackButton: true,
    ),
    OnBoardingModel(
      title: "Start Watching Now",
      img: AssetsManager.onBoarding6,
      gradiant: LinearGradient(
        colors: [
          Color(0xff2A2C30).withValues(alpha: 0.0),
          Color(0xff2A2C30).withValues(alpha: 1.0),
        ],
      ),
      buttonText: StringsManager.finish,
      showBackButton: true,
    ),
  ];
}
