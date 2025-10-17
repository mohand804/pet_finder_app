import 'package:dio/dio.dart';
import 'package:pet_finder_app/core/networking/api_constants.dart';
import 'package:pet_finder_app/features/home/data/model/cat_breed.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl, ParseErrorLogger? errorLogger}) =
      _ApiService;

  @GET(ApiConstants.getBreeds)
  Future<List<CatBreed>> getBreeds(
    @Query('limit') int limit,
    @Query('page') int page,
  );
  @GET(ApiConstants.searchBreeds)
  Future<List<CatBreed>> searchBreeds(
    @Query('q') String query,
    @Query('attach_image') int attachImage,
  );
}
