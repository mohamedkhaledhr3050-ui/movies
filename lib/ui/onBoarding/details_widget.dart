import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/resources/colors_manager.dart';
import 'package:movies/core/resources/routes_manager.dart';
import 'package:movies/core/resources/strings_manager.dart';
import 'package:movies/core/reusable/main_button.dart';
import 'package:movies/ui/onBoarding/on_boarding_model.dart';

class DetailsWidget extends StatelessWidget {
  final OnBoardingModel model;
  final int index;
  final PageController controller;

  const DetailsWidget({super.key, required this.model, required this.index, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          model.img,
          width: double.infinity,
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: model.gradiant),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: REdgeInsets.all(16),
              decoration: index == 0
                  ? null
                  : BoxDecoration(
                      color: ColorsManager.secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    model.desc,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: 24.h),
                  MainButton(onClick: () {
                    if(index == OnBoardingModel.model.length - 1){
                      Navigator.pushReplacementNamed(context, RoutesManager.login);
                    }
                    else{
                      controller.animateToPage( index + 1, duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
                    }
                  }, title: model.buttonText),

                  if (model.showBackButton) ...[
                    SizedBox(height: 16.h),
                    MainButton(
                      onClick: () {
                        controller.animateToPage(index - 1, duration: Duration(milliseconds: 300), curve: Curves.easeInSine);
                      },
                      title: StringsManager.back,
                      backgroundColor: Colors.transparent,
                      borderColor: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
