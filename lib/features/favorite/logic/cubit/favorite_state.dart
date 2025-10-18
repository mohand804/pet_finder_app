import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/features/favorite/data/model/add_to_favorite_response_model.dart';
import 'package:pet_finder_app/features/favorite/data/model/favorite_response_model.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.success(List<FavoriteResponseModel> favorites) =
      Success;
  const factory FavoriteState.addToFavoriteSuccess(
    AddToFavoriteResponseModel addToFavoriteResponseModel,
  ) = AddToFavoriteSuccess;
  const factory FavoriteState.deleteFromFavoriteSuccess() =
      DeleteFromFavoriteSuccess;
  const factory FavoriteState.failure(ApiErrorModel apiErrorModel) = Failure;
}
