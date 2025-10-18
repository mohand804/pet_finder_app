import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/favorite/data/model/favorite_requset_model.dart';
import 'package:pet_finder_app/features/favorite/data/repo/favorite_repo.dart';
import 'package:pet_finder_app/features/favorite/logic/cubit/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;
  FavoriteCubit(this._favoriteRepo) : super(FavoriteState.initial());
  Future<void> getFavourites() async {
    emit(FavoriteState.loading());
    final result = await _favoriteRepo.getFavourites();
    result.when(
      success: (favorites) => emit(FavoriteState.success(favorites)),
      failure: (apiErrorModel) => emit(FavoriteState.failure(apiErrorModel)),
    );
  }

  // Future<void> getFavouriteById(int id) async {
  //   emit(FavoriteState.loading());
  //   final result = await _favoriteRepo.getFavouriteById(id);
  //   result.when(
  //     success: (favorite) => emit(FavoriteState.success(favorite)),
  //     failure: (apiErrorModel) => emit(FavoriteState.failure(apiErrorModel)),
  //   );
  // }

  Future<void> addFavourite(FavoriteRequestModel favoriteRequestModel) async {
    emit(FavoriteState.loading());
    final result = await _favoriteRepo.addFavourite(favoriteRequestModel);
    result.when(
      success: (favorite) => emit(FavoriteState.addToFavoriteSuccess(favorite)),
      failure: (apiErrorModel) => emit(FavoriteState.failure(apiErrorModel)),
    );
  }

  Future<void> deleteFavourite(int id) async {
    final currentFavorites = state.maybeWhen(
      success: (favorites) => favorites,
      orElse: () => null,
    );

    if (currentFavorites == null) return;
    final updatedFavorites = currentFavorites
        .where((favorite) => favorite.id != id)
        .toList();
    emit(FavoriteState.success(updatedFavorites));
    final result = await _favoriteRepo.deleteFavourite(id);
    result.when(
      success: (_) {},
      failure: (apiErrorModel) {
        emit(FavoriteState.success(currentFavorites));
        emit(FavoriteState.failure(apiErrorModel));
      },
    );
  }
}
