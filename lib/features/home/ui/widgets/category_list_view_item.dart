import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/theming/colors.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';

const List<String> catSearchKeywords = [
  "All",
  "Bengal",
  "Birman",
  "Bombay",
  "British Shorthair",
  "Burmese",
  "Chartreux",
  "California Spangled",
  "Affectionate",
  "Intelligent",
  "Playful",
];

class CategoryListViewItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String category;

  const CategoryListViewItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? ColorsManager.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? ColorsManager.primaryColor : Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeightHelper.medium,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }
}
