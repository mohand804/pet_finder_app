import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/theming/colors.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';
import 'package:pet_finder_app/features/home/data/model/cat_breed.dart';

class BreedListViewItem extends StatefulWidget {
  final CatBreed breed;
  const BreedListViewItem({super.key, required this.breed});

  @override
  State<BreedListViewItem> createState() => _BreedListViewItemState();
}

class _BreedListViewItemState extends State<BreedListViewItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.breed.image!.url!),
                onError: (error, stackTrace) =>
                    Icon(Icons.error, size: 70.w, color: Colors.grey[300]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.breed.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: Colors.black,
                  ),
                ),
                verticalSpace(4),
                Text(
                  widget.breed.lifeSpan ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeightHelper.regular,
                    color: Colors.grey[600],
                  ),
                ),
                verticalSpace(8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14.sp,
                      color: ColorsManager.primaryColor,
                    ),
                    horizontalSpace(4),
                    Text(
                      widget.breed.lifeSpan ?? '',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeightHelper.medium,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                verticalSpace(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14.sp,
                      color: ColorsManager.primaryColor,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      widget.breed.lifeSpan ?? '',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeightHelper.medium,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: isFavorite
                    ? ColorsManager.primaryColor.withValues(alpha: 0.1)
                    : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 20.sp,
                color: isFavorite
                    ? ColorsManager.primaryColor
                    : Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
