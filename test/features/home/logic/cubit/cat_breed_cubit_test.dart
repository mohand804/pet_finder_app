import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/networking/api_error_model.dart';
import 'package:pet_finder_app/core/networking/api_result.dart';
import 'package:pet_finder_app/features/home/data/model/cat_breed.dart';
import 'package:pet_finder_app/features/home/data/model/cat_image.dart';
import 'package:pet_finder_app/features/home/data/model/weight.dart';
import 'package:pet_finder_app/features/home/data/repo/cat_breed_repo.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_cubit.dart';
import 'package:pet_finder_app/features/home/logic/cubit/cat_breed_state.dart'
    as state;

class MockCatBreedRepo extends Mock implements CatBreedRepo {}

void main() {
  late CatBreedCubit catBreedCubit;
  late MockCatBreedRepo mockCatBreedRepo;

  setUp(() {
    mockCatBreedRepo = MockCatBreedRepo();
    catBreedCubit = CatBreedCubit(mockCatBreedRepo);
  });

  tearDown(() {
    catBreedCubit.close();
  });

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

  group('CatBreedCubit', () {
    test('initial state should be CatBreedState.initial()', () {
      expect(catBreedCubit.state, equals(const state.CatBreedState.initial()));
    });

    test('searchController should be initialized', () {
      expect(catBreedCubit.searchController, isNotNull);
      expect(catBreedCubit.searchController.text, isEmpty);
    });

    group('getBreeds', () {
      blocTest<CatBreedCubit, state.CatBreedState>(
        'emits [loading, success] when getBreeds succeeds',
        build: () {
          final mockBreeds = createMockCatBreeds();

          when(
            () => mockCatBreedRepo.getBreeds(10, 0),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          return catBreedCubit;
        },
        act: (cubit) => cubit.getBreeds(10, 0),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Success>().having(
            (s) => (s).breeds.length,
            'breeds length',
            2,
          ),
        ],
        verify: (_) {
          verify(() => mockCatBreedRepo.getBreeds(10, 0)).called(1);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'emits [loading, failure] when getBreeds fails',
        build: () {
          final errorModel = ApiErrorModel(message: 'Failed to fetch breeds');

          when(
            () => mockCatBreedRepo.getBreeds(10, 0),
          ).thenAnswer((_) async => ApiResult.failure(errorModel));

          return catBreedCubit;
        },
        act: (cubit) => cubit.getBreeds(10, 0),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Failure>().having(
            (f) => (f).apiErrorModel.message,
            'error message',
            'Failed to fetch breeds',
          ),
        ],
        verify: (_) {
          verify(() => mockCatBreedRepo.getBreeds(10, 0)).called(1);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'should call repo with correct parameters for pagination',
        build: () {
          final mockBreeds = createMockCatBreeds();

          when(
            () => mockCatBreedRepo.getBreeds(20, 2),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          return catBreedCubit;
        },
        act: (cubit) => cubit.getBreeds(20, 2),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Success>(),
        ],
        verify: (_) {
          verify(() => mockCatBreedRepo.getBreeds(20, 2)).called(1);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'emits success with empty list when API returns no breeds',
        build: () {
          when(
            () => mockCatBreedRepo.getBreeds(10, 0),
          ).thenAnswer((_) async => ApiResult.success(<CatBreed>[]));

          return catBreedCubit;
        },
        act: (cubit) => cubit.getBreeds(10, 0),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Success>().having(
            (s) => (s).breeds.isEmpty,
            'breeds is empty',
            true,
          ),
        ],
      );
    });

    group('searchBreeds', () {
      blocTest<CatBreedCubit, state.CatBreedState>(
        'emits [loading, success] when searchBreeds succeeds',
        build: () {
          final mockBreeds = [createMockCatBreeds()[0]];

          when(
            () => mockCatBreedRepo.searchBreeds('abys', 1),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          return catBreedCubit;
        },
        act: (cubit) => cubit.searchBreeds('abys'),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Success>()
              .having((s) => (s).breeds.length, 'breeds length', 1)
              .having((s) => (s).breeds.first.name, 'breed name', 'Abyssinian'),
        ],
        verify: (_) {
          verify(() => mockCatBreedRepo.searchBreeds('abys', 1)).called(1);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'emits [loading, failure] when searchBreeds fails',
        build: () {
          final errorModel = ApiErrorModel(message: 'Search failed');

          when(
            () => mockCatBreedRepo.searchBreeds('test', 1),
          ).thenAnswer((_) async => ApiResult.failure(errorModel));

          return catBreedCubit;
        },
        act: (cubit) => cubit.searchBreeds('test'),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Failure>().having(
            (f) => (f).apiErrorModel.message,
            'error message',
            'Search failed',
          ),
        ],
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'should call repo with correct attachImage parameter',
        build: () {
          final mockBreeds = createMockCatBreeds();

          when(
            () => mockCatBreedRepo.searchBreeds('aege', 0),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          return catBreedCubit;
        },
        act: (cubit) => cubit.searchBreeds('aege', attachImage: 0),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Success>(),
        ],
        verify: (_) {
          verify(() => mockCatBreedRepo.searchBreeds('aege', 0)).called(1);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'emits success with empty list when search returns no results',
        build: () {
          when(
            () => mockCatBreedRepo.searchBreeds('xyz', 1),
          ).thenAnswer((_) async => ApiResult.success(<CatBreed>[]));

          return catBreedCubit;
        },
        act: (cubit) => cubit.searchBreeds('xyz'),
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Success>().having(
            (s) => (s).breeds.isEmpty,
            'breeds is empty',
            true,
          ),
        ],
      );
    });

    group('clearSearch', () {
      blocTest<CatBreedCubit, state.CatBreedState>(
        'clears search controller and emits initial state',
        build: () => catBreedCubit,
        seed: () {
          catBreedCubit.searchController.text = 'test query';
          return const state.CatBreedState.success([]);
        },
        act: (cubit) => cubit.clearSearch(),
        expect: () => [const state.CatBreedState.initial()],
        verify: (cubit) {
          expect(cubit.searchController.text, isEmpty);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'should clear search from any state including loading',
        build: () => catBreedCubit,
        seed: () {
          catBreedCubit.searchController.text = 'searching...';
          return const state.CatBreedState.loading();
        },
        act: (cubit) => cubit.clearSearch(),
        expect: () => [const state.CatBreedState.initial()],
        verify: (cubit) {
          expect(cubit.searchController.text, isEmpty);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'should clear search from failure state',
        build: () => catBreedCubit,
        seed: () {
          catBreedCubit.searchController.text = 'failed search';
          return state.CatBreedState.failure(ApiErrorModel(message: 'Error'));
        },
        act: (cubit) => cubit.clearSearch(),
        expect: () => [const state.CatBreedState.initial()],
        verify: (cubit) {
          expect(cubit.searchController.text, isEmpty);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'should work even when controller is already empty',
        build: () => catBreedCubit,
        seed: () => const state.CatBreedState.success([]),
        act: (cubit) {
          cubit.searchController.clear();
          cubit.clearSearch();
        },
        expect: () => [const state.CatBreedState.initial()],
        verify: (cubit) {
          expect(cubit.searchController.text, isEmpty);
        },
      );
    });

    group('Search workflow integration', () {
      blocTest<CatBreedCubit, state.CatBreedState>(
        'should handle complete search and clear workflow',
        build: () {
          final mockBreeds = createMockCatBreeds();

          when(
            () => mockCatBreedRepo.searchBreeds('abys', 1),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          return catBreedCubit;
        },
        act: (cubit) async {
          cubit.searchController.text = 'abys';
          await cubit.searchBreeds('abys');

          await Future.delayed(const Duration(milliseconds: 100));
          cubit.clearSearch();
        },
        expect: () => [
          const state.CatBreedState.loading(),
          isA<state.Success>(),
          const state.CatBreedState.initial(),
        ],
        verify: (cubit) {
          expect(cubit.searchController.text, isEmpty);
        },
      );
    });

    group('Edge cases', () {
      blocTest<CatBreedCubit, state.CatBreedState>(
        'should handle multiple rapid getBreeds calls',
        build: () {
          final mockBreeds = createMockCatBreeds();

          when(
            () => mockCatBreedRepo.getBreeds(any(), any()),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          return catBreedCubit;
        },
        act: (cubit) async {
          cubit.getBreeds(10, 0);
          cubit.getBreeds(10, 1);
        },
        skip: 1,
        verify: (_) {
          verify(() => mockCatBreedRepo.getBreeds(10, 0)).called(1);
          verify(() => mockCatBreedRepo.getBreeds(10, 1)).called(1);
        },
      );

      blocTest<CatBreedCubit, state.CatBreedState>(
        'should handle switching between getBreeds and searchBreeds',
        build: () {
          final mockBreeds = createMockCatBreeds();

          when(
            () => mockCatBreedRepo.getBreeds(10, 0),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));
          when(
            () => mockCatBreedRepo.searchBreeds('test', 1),
          ).thenAnswer((_) async => ApiResult.success(mockBreeds));

          return catBreedCubit;
        },
        act: (cubit) async {
          await cubit.getBreeds(10, 0);
          await cubit.searchBreeds('test');
        },
        verify: (_) {
          verify(() => mockCatBreedRepo.getBreeds(10, 0)).called(1);
          verify(() => mockCatBreedRepo.searchBreeds('test', 1)).called(1);
        },
      );
    });
  });
}
