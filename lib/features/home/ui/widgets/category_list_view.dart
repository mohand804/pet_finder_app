import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_cubit.dart';
import 'package:pet_finder_app/features/home/ui/widgets/category_list_view_item.dart';

class CategoryListView extends StatefulWidget {
  const CategoryListView({super.key});

  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: catSearchKeywords.length,
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final category = catSearchKeywords[index];
          return CategoryListViewItem(
            category: category,
            isSelected: category == selectedCategory,
            onTap: () {
              if (category == "All") {
                context.read<CatBreedCubit>().getBreeds(10, 1);
              } else {
                context.read<CatBreedCubit>().searchBreeds(category);
              }
              setState(() {
                selectedCategory = category;
              });
            },
          );
        },
      ),
    );
  }
}
