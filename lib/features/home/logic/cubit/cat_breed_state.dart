import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/features/home/data/model/cat_breed.dart';

part 'cat_breed_state.freezed.dart';

@freezed
class CatBreedState with _$CatBreedState {
  const factory CatBreedState.initial() = _Initial;
  const factory CatBreedState.loading() = Loading;
  const factory CatBreedState.success(List<CatBreed> breeds) = Success;
  const factory CatBreedState.failure(ApiErrorModel apiErrorModel) = Failure;
}
