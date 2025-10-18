import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/routing/routes.dart';
import 'package:pet_finder_app/core/widgets/bottom_nav_bar/layout_screen.dart';
import 'package:pet_finder_app/features/favorite/logic/cubit/favorite_cubit.dart';
import 'package:pet_finder_app/features/favorite/ui/favorite_screen.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_cubit.dart';
import 'package:pet_finder_app/features/home/ui/home_screen.dart';
import 'package:pet_finder_app/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.layoutScreen:
        final tabIndex = arguments as int? ?? 0;
        return MaterialPageRoute(
          builder: (_) => LayoutScreen(tabIndex: tabIndex),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<FavoriteCubit>()),
              BlocProvider(create: (context) => getIt<CatBreedCubit>()),
            ],
            child: const HomeScreen(),
          ),
        );
      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => getIt<FavoriteCubit>()),
            ],
            child: const FavoriteScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
