import 'package:flutter/material.dart';
import 'package:pet_finder_app/core/di/dependency_injection.dart';
import 'package:pet_finder_app/core/routing/app_router.dart';
import 'package:pet_finder_app/pet_finder_app.dart';

void main() {
  setupGetIt();
  runApp(PetFinderApp(appRouter: AppRouter()));
}
