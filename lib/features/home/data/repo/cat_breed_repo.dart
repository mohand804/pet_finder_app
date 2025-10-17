import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/features/home/data/model/cat_breed.dart';

class CatBreedRepo {
  final ApiService _apiService;
  CatBreedRepo(this._apiService);

  Future<ApiResult<List<CatBreed>>> getBreeds(int limit, int page) async {
    try {
      final response = await _apiService.getBreeds(limit, page);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }

  Future<ApiResult<List<CatBreed>>> searchBreeds(
    String query,
    int attachImage,
  ) async {
    try {
      final response = await _apiService.searchBreeds(query, attachImage);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }
}
