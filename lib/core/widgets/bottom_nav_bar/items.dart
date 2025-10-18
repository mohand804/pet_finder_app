import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/ui/favorite_screen.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_cubit.dart';
import 'package:pet_finder_app/features/home/ui/home_screen.dart';

final List<Widget> screens = [
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<CatBreedCubit>()),
      BlocProvider(create: (context) => getIt<FavoriteCubit>()),
    ],
    child: const HomeScreen(),
  ),
  BlocProvider(
    create: (context) => getIt<FavoriteCubit>(),
    child: const FavoriteScreen(),
  ),
];
