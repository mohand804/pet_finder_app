import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/theming/colors.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';
import 'package:pet_finder_app/features/favorite/data/model/favorite_response_model.dart';

class FavoritePetCard extends StatelessWidget {
  final FavoriteResponseModel favorite;
  final VoidCallback onFavoriteTap;

  const FavoritePetCard({
    super.key,
    required this.favorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F6F5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pet Image
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                image: DecorationImage(
                  image: NetworkImage(favorite.image.url ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Pet Info
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Pet Name",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeightHelper.semiBold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: onFavoriteTap,
                      child: Icon(
                        Icons.favorite,
                        color: ColorsManager.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
                verticalSpace(4.h),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red, size: 12.sp),
                    horizontalSpace(4),
                    Text(
                      '1.0 km away',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeightHelper.regular,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
