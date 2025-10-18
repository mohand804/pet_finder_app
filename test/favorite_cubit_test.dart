import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/features/favorite/data/model/add_to_favorite_response_model.dart';
import 'package:pet_finder_app/features/favorite/data/model/favorite_requset_model.dart';
import 'package:pet_finder_app/features/favorite/data/model/favorite_response_model.dart';
import 'package:pet_finder_app/features/favorite/data/repo/favorite_repo.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late FavoriteRepo favoriteRepo;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    favoriteRepo = FavoriteRepo(mockApiService);
  });

  group('FavoriteRepo', () {
    group('getFavourites', () {
      test(
        'should return success with list of favorites when API call succeeds',
        () async {
          final mockFavorites = [
            FavoriteResponseModel(
              id: 1,
              userId: 'user1',
              imageId: 'img1',
              subId: 'sub1',
              createdAt: '2024-01-01',
              image: FavoriteImage(
                id: 'img1',
                url: 'https://example.com/cat.jpg',
              ),
            ),
          ];

          when(
            () => mockApiService.getFavourites(),
          ).thenAnswer((_) async => mockFavorites);

          final result = await favoriteRepo.getFavourites();

          expect(result, isA<Success<List<FavoriteResponseModel>>>());
          result.when(
            success: (favorites) {
              expect(favorites, mockFavorites);
              expect(favorites.length, 1);
            },
            failure: (_) => fail('Should not be failure'),
          );

          verify(() => mockApiService.getFavourites()).called(1);
        },
      );

      test('should return failure when API call throws exception', () async {
        when(
          () => mockApiService.getFavourites(),
        ).thenThrow(Exception('Network error'));

        final result = await favoriteRepo.getFavourites();

        expect(result, isA<Failure<List<FavoriteResponseModel>>>());
        result.when(
          success: (_) => fail('Should not be success'),
          failure: (error) {
            expect(error.message, contains('Network error'));
          },
        );

        verify(() => mockApiService.getFavourites()).called(1);
      });
    });

    group('addFavourite', () {
      test('should return success when adding favorite succeeds', () async {
        final requestModel = FavoriteRequestModel(
          imageId: 'img1',
          subId: 'sub1',
        );
        final mockResponse = AddToFavoriteResponseModel(
          id: 1,
          message: 'SUCCESS',
        );

        when(
          () => mockApiService.addFavourite(requestModel),
        ).thenAnswer((_) async => mockResponse);

        final result = await favoriteRepo.addFavourite(requestModel);

        expect(result, isA<Success<AddToFavoriteResponseModel>>());
        result.when(
          success: (response) {
            expect(response, mockResponse);
            expect(response.message, 'SUCCESS');
          },
          failure: (_) => fail('Should not be failure'),
        );

        verify(() => mockApiService.addFavourite(requestModel)).called(1);
      });

      test(
        'should return failure when adding favorite throws exception',
        () async {
          final requestModel = FavoriteRequestModel(
            imageId: 'img1',
            subId: 'sub1',
          );

          when(
            () => mockApiService.addFavourite(requestModel),
          ).thenThrow(Exception('Failed to add'));

          final result = await favoriteRepo.addFavourite(requestModel);

          expect(result, isA<Failure<AddToFavoriteResponseModel>>());
          result.when(
            success: (_) => fail('Should not be success'),
            failure: (error) {
              expect(error.message, contains('Failed to add'));
            },
          );
        },
      );
    });

    group('deleteFavourite', () {
      test('should return success when deleting favorite succeeds', () async {
        const favoriteId = 1;

        when(
          () => mockApiService.deleteFavourite(favoriteId),
        ).thenAnswer((_) async => Future.value());

        final result = await favoriteRepo.deleteFavourite(favoriteId);

        expect(result, isA<Success<void>>());
        result.when(
          success: (_) => expect(true, isTrue),
          failure: (_) => fail('Should not be failure'),
        );

        verify(() => mockApiService.deleteFavourite(favoriteId)).called(1);
      });

      test(
        'should return failure when deleting favorite throws exception',
        () async {
          const favoriteId = 1;

          when(
            () => mockApiService.deleteFavourite(favoriteId),
          ).thenThrow(Exception('Failed to delete'));

          final result = await favoriteRepo.deleteFavourite(favoriteId);

          expect(result, isA<Failure<void>>());
          result.when(
            success: (_) => fail('Should not be success'),
            failure: (error) {
              expect(error.message, contains('Failed to delete'));
            },
          );
        },
      );
    });
  });
}
