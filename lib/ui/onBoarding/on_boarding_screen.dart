import 'package:flutter/material.dart';
import 'package:movies/ui/onBoarding/details_widget.dart';
import 'package:movies/ui/onBoarding/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemBuilder: (context, index) => DetailsWidget(
          model: OnBoardingModel.model[index],
          index: index,
          controller: controller,
        ),
        itemCount: OnBoardingModel.model.length,
      ),
    );
  }
}
