import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/core/networking/api_service.dart';
import 'package:pet_finder_app/features/home/data/model/cat_breed.dart';
import 'package:pet_finder_app/features/home/data/model/cat_image.dart';
import 'package:pet_finder_app/features/home/data/model/weight.dart';
import 'package:pet_finder_app/features/home/data/repo/cat_breed_repo.dart';

// Create a mock for ApiService
class MockApiService extends Mock implements ApiService {}

void main() {
  // Declare variables that will be used across tests
  late CatBreedRepo catBreedRepo;
  late MockApiService mockApiService;

  // This runs before each test
  setUp(() {
    mockApiService = MockApiService();
    catBreedRepo = CatBreedRepo(mockApiService);
  });

  // Helper function to create mock cat breeds for testing
  List<CatBreed> createMockCatBreeds() {
    return [
      CatBreed(
        id: 'abys',
        name: 'Abyssinian',
        weight: Weight(imperial: '7 - 10', metric: '3 - 5'),
        origin: 'Egypt',
        description: 'The Abyssinian is easy to care for...',
        temperament: 'Active, Energetic, Independent',
        lifeSpan: '14 - 15',
        image: CatImage(
          id: 'img1',
          url: 'https://example.com/abyssinian.jpg',
          width: 1200,
          height: 800,
        ),
        referenceImageId: 'img1',
      ),
      CatBreed(
        id: 'aege',
        name: 'Aegean',
        weight: Weight(imperial: '9 - 10', metric: '4 - 5'),
        origin: 'Greece',
        description: 'Native to the Greek islands...',
        temperament: 'Affectionate, Social, Intelligent',
        lifeSpan: '9 - 12',
        image: CatImage(
          id: 'img2',
          url: 'https://example.com/aegean.jpg',
          width: 1200,
          height: 800,
        ),
        referenceImageId: 'img2',
      ),
    ];
  }

  // Group related tests together
  group('CatBreedRepo', () {
    // Test getBreeds method
    group('getBreeds', () {
      test(
        'should return success with list of cat breeds when API call succeeds',
        () async {
          // Arrange - Set up test data and mock behavior
          final mockBreeds = createMockCatBreeds();

          // Tell the mock what to return when getBreeds is called
          when(
            () => mockApiService.getBreeds(10, 0),
          ).thenAnswer((_) async => mockBreeds);

          // Act - Execute the method we're testing
          final result = await catBreedRepo.getBreeds(10, 0);

          // Assert - Verify the result is what we expect
          expect(result, isA<Success<List<CatBreed>>>());
          result.when(
            success: (breeds) {
              expect(breeds, mockBreeds);
              expect(breeds.length, 2);
              expect(breeds[0].name, 'Abyssinian');
              expect(breeds[1].name, 'Aegean');
            },
            failure: (_) => fail('Should not be failure'),
          );

          // Verify that the API service was called exactly once with correct parameters
          verify(() => mockApiService.getBreeds(10, 0)).called(1);
        },
      );

      test('should return failure when API call throws exception', () async {
        // Arrange
        when(
          () => mockApiService.getBreeds(10, 0),
        ).thenThrow(Exception('Network error'));

        // Act
        final result = await catBreedRepo.getBreeds(10, 0);

        // Assert
        expect(result, isA<Failure<List<CatBreed>>>());
        result.when(
          success: (_) => fail('Should not be success'),
          failure: (error) {
            expect(error.message, contains('Network error'));
          },
        );

        verify(() => mockApiService.getBreeds(10, 0)).called(1);
      });

      test('should handle different limit and page parameters', () async {
        // Arrange
        final mockBreeds = createMockCatBreeds();

        when(
          () => mockApiService.getBreeds(20, 2),
        ).thenAnswer((_) async => mockBreeds);

        // Act
        final result = await catBreedRepo.getBreeds(20, 2);

        // Assert
        expect(result, isA<Success<List<CatBreed>>>());
        verify(() => mockApiService.getBreeds(20, 2)).called(1);
      });

      test('should return empty list when API returns no breeds', () async {
        // Arrange
        when(
          () => mockApiService.getBreeds(10, 0),
        ).thenAnswer((_) async => <CatBreed>[]);

        // Act
        final result = await catBreedRepo.getBreeds(10, 0);

        // Assert
        expect(result, isA<Success<List<CatBreed>>>());
        result.when(
          success: (breeds) {
            expect(breeds, isEmpty);
          },
          failure: (_) => fail('Should not be failure'),
        );
      });
    });

    // Test searchBreeds method
    group('searchBreeds', () {
      test(
        'should return success with filtered breeds when search succeeds',
        () async {
          // Arrange
          final mockBreeds = [createMockCatBreeds()[0]]; // Only Abyssinian
          const query = 'abys';
          const attachImage = 1;

          when(
            () => mockApiService.searchBreeds(query, attachImage),
          ).thenAnswer((_) async => mockBreeds);

          // Act
          final result = await catBreedRepo.searchBreeds(query, attachImage);

          // Assert
          expect(result, isA<Success<List<CatBreed>>>());
          result.when(
            success: (breeds) {
              expect(breeds.length, 1);
              expect(breeds[0].name, 'Abyssinian');
              expect(breeds[0].id, 'abys');
            },
            failure: (_) => fail('Should not be failure'),
          );

          verify(
            () => mockApiService.searchBreeds(query, attachImage),
          ).called(1);
        },
      );

      test(
        'should return failure when search API call throws exception',
        () async {
          // Arrange
          const query = 'test';
          const attachImage = 1;

          when(
            () => mockApiService.searchBreeds(query, attachImage),
          ).thenThrow(Exception('Search failed'));

          // Act
          final result = await catBreedRepo.searchBreeds(query, attachImage);

          // Assert
          expect(result, isA<Failure<List<CatBreed>>>());
          result.when(
            success: (_) => fail('Should not be success'),
            failure: (error) {
              expect(error.message, contains('Search failed'));
            },
          );
        },
      );

      test(
        'should handle search with attachImage parameter set to 0',
        () async {
          // Arrange
          final mockBreeds = createMockCatBreeds();
          const query = 'aege';
          const attachImage = 0;

          when(
            () => mockApiService.searchBreeds(query, attachImage),
          ).thenAnswer((_) async => mockBreeds);

          // Act
          final result = await catBreedRepo.searchBreeds(query, attachImage);

          // Assert
          expect(result, isA<Success<List<CatBreed>>>());
          verify(
            () => mockApiService.searchBreeds(query, attachImage),
          ).called(1);
        },
      );

      test(
        'should return empty list when no breeds match search query',
        () async {
          // Arrange
          const query = 'nonexistent';
          const attachImage = 1;

          when(
            () => mockApiService.searchBreeds(query, attachImage),
          ).thenAnswer((_) async => <CatBreed>[]);

          // Act
          final result = await catBreedRepo.searchBreeds(query, attachImage);

          // Assert
          expect(result, isA<Success<List<CatBreed>>>());
          result.when(
            success: (breeds) {
              expect(breeds, isEmpty);
            },
            failure: (_) => fail('Should not be failure'),
          );
        },
      );

      test('should handle case-sensitive search queries', () async {
        // Arrange
        final mockBreeds = createMockCatBreeds();
        const queryUpperCase = 'ABYS';
        const attachImage = 1;

        when(
          () => mockApiService.searchBreeds(queryUpperCase, attachImage),
        ).thenAnswer((_) async => mockBreeds);

        // Act
        final result = await catBreedRepo.searchBreeds(
          queryUpperCase,
          attachImage,
        );

        // Assert
        expect(result, isA<Success<List<CatBreed>>>());
        verify(
          () => mockApiService.searchBreeds(queryUpperCase, attachImage),
        ).called(1);
      });
    });
  });
}
