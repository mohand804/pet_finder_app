import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_finder_app/core/helpers/spacing.dart';
import 'package:pet_finder_app/core/theming/font_weight_helper.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_cubit.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_state.dart';
import 'package:pet_finder_app/features/home/ui/widgets/breed_list_veiw_item.dart';
import 'package:pet_finder_app/features/home/ui/widgets/category_list_view.dart';
import 'package:pet_finder_app/features/home/ui/widgets/home_header.dart';
import 'package:pet_finder_app/features/home/ui/widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CatBreedCubit>().getBreeds(10, 1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                      const HomeHeader(),
                      verticalSpace(20),
                      SearchBarWidget(
                        onSearch: (value) {
                          if (value.isEmpty) {
                            context.read<CatBreedCubit>().getBreeds(10, 1);
                          } else {
                            context.read<CatBreedCubit>().searchBreeds(
                              value,
                              attachImage: 1,
                            );
                          }
                        },
                      ),
                      verticalSpace(20),
                      Text(
                        'Most Relevant Breeds',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeightHelper.semiBold,
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace(12),
                      const CategoryListView(),
                      verticalSpace(20),
                      Expanded(
                        child: BlocBuilder<CatBreedCubit, CatBreedState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const SizedBox.shrink(),
                              success: (breeds) => ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: breeds.length,
                                itemBuilder: (context, index) =>
                                    BreedListViewItem(breed: breeds[index]),
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
      ),
    );
  }
}
