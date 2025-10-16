import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/constant.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/theming/styles.dart';
import 'package:pet_finder_app/core/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(80),
          Image.asset('${AppConstants.imagePath}on_boarding.png'),
          verticalSpace(100),
          Text(
            'Find Your Best\n Companion With Us',
            style: TextStyleManager.font32BlackBold,
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          Text(
            'Join & discover the best suitable pets as\n per your preferences in your location',
            style: TextStyleManager.font14MediumGrayRegular,
            textAlign: TextAlign.center,
          ),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(text: 'Get Started', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
