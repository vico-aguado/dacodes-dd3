import 'package:bloc_test/bloc_test.dart';
import 'package:dacodes_dd3/src/data/repositories/characters_repository.dart';
import 'package:dacodes_dd3/src/domain/models/characters_response_model.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/domain/models/event_model.dart';
import 'package:dacodes_dd3/src/domain/models/series_model.dart';
import 'package:dacodes_dd3/src/domain/models/story_model.dart';
import 'package:dacodes_dd3/src/ui/screens/detail/bloc/detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  group('[ Detail Bloc ]', () {
    late DetailBloc blocTMP;
    late MockCharactersRepository mockRepository;

    setUp(() {
      mockRepository = MockCharactersRepository();
      blocTMP = DetailBloc(mockRepository);
    });

    tearDown(() {
      blocTMP.close();
    });

    test('=> Initial call state', () {
      expect(
        blocTMP.state,
        const DetailInitialState(
          Model(),
          DetailType.none,
        ),
      );
    });

    test('test InitEvent', () {
      const event = GetSectionsEvent(1);
      expect(event, equals(const GetSectionsEvent(1)));
      expect(event.props, equals([]));
    });

    test('test state', () {
      const model = Model();
      const state = DetailInitialState(
        model,
        DetailType.none,
      );
      expect(
        state,
        equals(
          const DetailInitialState(
            model,
            DetailType.none,
          ),
        ),
      );
      expect(state.props, equals([model, DetailType.none]));

      final stateCopy = state.model.copyWith();
      expect(stateCopy, equals(model));
    });

    blocTest<DetailBloc, DetailState>(
      '=> Initial Bloc',
      build: () => blocTMP,
      verify: (bloc) {
        expect(bloc, equals(blocTMP));
      },
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetSectionsEvent',
      build: () {
        when(
          () => mockRepository.getComics('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Comic>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Comic>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        when(
          () => mockRepository.getEvents('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Event>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Event>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        when(
          () => mockRepository.getSeries('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Serie>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Serie>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        when(
          () => mockRepository.getStories('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Story>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Story>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetSectionsEvent(1));
      },
      wait: const Duration(seconds: 2),
      expect: () => [
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.comics,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(comics: []),
          DetailType.comics,
        ),
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.series,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(series: []),
          DetailType.series,
        ),
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.events,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(events: []),
          DetailType.events,
        ),
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.stories,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(stories: []),
          DetailType.stories,
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetComicsEvent',
      build: () {
        when(
          () => mockRepository.getComics('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Comic>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Comic>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetComicsEvent(1));
      },
      expect: () => [
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.comics,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(comics: []),
          DetailType.comics,
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetSeriesEvent',
      build: () {
        when(
          () => mockRepository.getSeries('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Serie>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Serie>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetSeriesEvent(1));
      },
      expect: () => [
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.series,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(series: []),
          DetailType.series,
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetEventsEvent',
      build: () {
        when(
          () => mockRepository.getEvents('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Event>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Event>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetEventsEvent(1));
      },
      expect: () => [
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.events,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(events: []),
          DetailType.events,
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetStoriesEvent',
      build: () {
        when(
          () => mockRepository.getStories('1', 0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Story>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Story>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );

        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetStoriesEvent(1));
      },
      expect: () => [
        GetDataLoadingState(
          blocTMP.state.model,
          DetailType.stories,
        ),
        GetDataLoadedState(
          blocTMP.state.model.copyWith(stories: []),
          DetailType.stories,
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetComicsEvent - GetDataFailedState State',
      build: () {
        when(
          () => mockRepository.getComics('1', 0),
        ).thenThrow(Exception('Error'));
        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetComicsEvent(1));
      },
      expect: () => [
        GetDataLoadingState(blocTMP.state.model, DetailType.comics),
        GetDataFailedState(
          blocTMP.state.model,
          DetailType.comics,
          'Error',
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetSeriesEvent - GetDataFailedState State',
      build: () {
        when(
          () => mockRepository.getSeries('1', 0),
        ).thenThrow(Exception('Error'));
        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetSeriesEvent(1));
      },
      expect: () => [
        GetDataLoadingState(blocTMP.state.model, DetailType.series),
        GetDataFailedState(
          blocTMP.state.model,
          DetailType.series,
          'Error',
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetEventsEvent - GetDataFailedState State',
      build: () {
        when(
          () => mockRepository.getEvents('1', 0),
        ).thenThrow(Exception('Error'));
        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetEventsEvent(1));
      },
      expect: () => [
        GetDataLoadingState(blocTMP.state.model, DetailType.events),
        GetDataFailedState(
          blocTMP.state.model,
          DetailType.events,
          'Error',
        )
      ],
    );

    blocTest<DetailBloc, DetailState>(
      '=> GetStoriesEvent - GetDataFailedState State',
      build: () {
        when(
          () => mockRepository.getStories('1', 0),
        ).thenThrow(Exception('Error'));
        return DetailBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GetStoriesEvent(1));
      },
      expect: () => [
        GetDataLoadingState(blocTMP.state.model, DetailType.stories),
        GetDataFailedState(
          blocTMP.state.model,
          DetailType.stories,
          'Error',
        )
      ],
    );
  });
}
