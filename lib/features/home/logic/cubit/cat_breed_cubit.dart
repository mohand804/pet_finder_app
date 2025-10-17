import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/data/repo/cat_breed_repo.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_state.dart';

class CatBreedCubit extends Cubit<CatBreedState> {
  final CatBreedRepo _catBreedRepo;
  CatBreedCubit(this._catBreedRepo) : super(CatBreedState.initial());
  TextEditingController searchController = TextEditingController();
  Future<void> getBreeds(int limit, int page) async {
    emit(CatBreedState.loading());
    final result = await _catBreedRepo.getBreeds(limit, page);
    result.when(
      success: (catBreed) => emit(CatBreedState.success(catBreed)),
      failure: (apiErrorModel) => emit(CatBreedState.failure(apiErrorModel)),
    );
  }

  Future<void> searchBreeds(String query, {int attachImage = 1}) async {
    emit(CatBreedState.loading());
    final result = await _catBreedRepo.searchBreeds(query, attachImage);
    result.when(
      success: (catBreed) => emit(CatBreedState.success(catBreed)),
      failure: (apiErrorModel) => emit(CatBreedState.failure(apiErrorModel)),
    );
  }

  void clearSearch() {
    searchController.clear();
    emit(CatBreedState.initial());
  }
}
