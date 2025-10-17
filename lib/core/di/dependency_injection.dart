import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_finder_app/core/networking/api_constants.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/core/networking/dio_factory.dart';
import 'package:pet_finder_app/features/home/data/repo/cat_breed_repo.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerSingleton<ApiService>(
    ApiService(dio, baseUrl: ApiConstants.baseUrl),
  );
  getIt.registerLazySingleton<CatBreedRepo>(
    () => CatBreedRepo(getIt<ApiService>()),
  );
  getIt.registerFactory<CatBreedCubit>(
    () => CatBreedCubit(getIt<CatBreedRepo>()),
  );
}
