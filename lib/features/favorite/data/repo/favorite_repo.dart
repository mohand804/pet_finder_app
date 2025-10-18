import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/features/favorite/data/model/add_to_favorite_response_model.dart';
import 'package:pet_finder_app/features/favorite/data/model/favorite_requset_model.dart';
import 'package:pet_finder_app/features/favorite/data/model/favorite_response_model.dart';

class FavoriteRepo {
  final ApiService _apiService;
  FavoriteRepo(this._apiService);

  Future<ApiResult<List<FavoriteResponseModel>>> getFavourites() async {
    try {
      final response = await _apiService.getFavourites();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }

  Future<ApiResult<FavoriteResponseModel>> getFavouriteById(int id) async {
    try {
      final response = await _apiService.getFavouriteById(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }

  Future<ApiResult<AddToFavoriteResponseModel>> addFavourite(
    FavoriteRequestModel favoriteRequestModel,
  ) async {
    try {
      final response = await _apiService.addFavourite(favoriteRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }

  Future<ApiResult<void>> deleteFavourite(int id) async {
    try {
      await _apiService.deleteFavourite(id);
      return ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }
}
