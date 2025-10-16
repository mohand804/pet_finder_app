import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/colors.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';

class TextStyleManager {
  static TextStyle font32BlackBold = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 32.sp,
    color: Colors.black,
  );
  static TextStyle font14MediumGrayRegular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 14.sp,
    color: ColorsManager.mediumGray,
  );
}
