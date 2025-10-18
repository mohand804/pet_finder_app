import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';
import 'package:pet_finder_app/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/logic/cubit/favorite_state.dart';
import 'package:pet_finder_app/features/favorite/ui/widgets/favorite_pet_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    Text(
                      'Your Favorite Pets',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeightHelper.bold,
                        color: Colors.black,
                      ),
                    ),
                    verticalSpace(20),
                    Expanded(
                      child: BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => const SizedBox.shrink(),
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            success: (favorites) {
                              if (favorites.isEmpty) {
                                return Center(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        size: 64.sp,
                                        color: Colors.grey[400],
                                      ),
                                      verticalSpace(16),
                                      Text(
                                        'No favorites yet',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeightHelper.medium,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      verticalSpace(8),
                                      Text(
                                        'Start adding pets to your favorites!',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeightHelper.regular,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16.w,
                                      mainAxisSpacing: 16.h,
                                      childAspectRatio: 0.75,
                                    ),
                                itemCount: favorites.length,
                                itemBuilder: (context, index) {
                                  final favorite = favorites[index];
                                  return FavoritePetCard(
                                    favorite: favorite,
                                    onFavoriteTap: () {
                                      context
                                          .read<FavoriteCubit>()
                                          .deleteFavourite(favorite.id);
                                    },
                                  );
                                },
                              );
                            },
                            failure: (error) => Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 64.sp,
                                    color: Colors.red[300],
                                  ),
                                  verticalSpace(16),
                                  Text(
                                    'Failed to load favorites',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeightHelper.medium,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  verticalSpace(8),
                                  Text(
                                    error.message.isNotEmpty
                                        ? error.message
                                        : 'Please try again later',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeightHelper.regular,
                                      color: Colors.grey[500],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
