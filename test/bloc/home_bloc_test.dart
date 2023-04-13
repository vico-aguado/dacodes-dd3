import 'package:bloc_test/bloc_test.dart';
import 'package:dacodes_dd3/src/data/repositories/characters_repository.dart';
import 'package:dacodes_dd3/src/data/sources/remote/characters_source.dart';
import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/domain/models/characters_response_model.dart';
import 'package:dacodes_dd3/src/ui/screens/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharactersRepository extends Mock implements CharactersRepository {}

class MockCharacterRemoteSource extends Mock implements CharacterRemoteSource {}

void main() {
  group('[ Home Bloc ]', () {
    late HomeBloc blocTMP;
    late MockCharactersRepository mockRepository;

    setUp(() {
      mockRepository = MockCharactersRepository();
      blocTMP = HomeBloc(mockRepository);
    });

    tearDown(() {
      blocTMP.close();
    });

    test('=> Initial call state', () {
      expect(blocTMP.state, const HomeInitialState(Model()));
    });

    test('test InitEvent', () {
      final event = GetCharactersEvent();
      expect(event, equals(GetCharactersEvent()));
      expect(event.props, equals([]));
    });

    test('test state', () {
      const model = Model();
      const state = HomeInitialState(model);
      expect(state, equals(const HomeInitialState(model)));
      expect(state.props, equals([model]));

      final stateCopy = state.model.copyWith();
      expect(stateCopy, equals(model));
    });

    blocTest<HomeBloc, HomeState>(
      '=> Initial Bloc',
      build: () => blocTMP,
      verify: (bloc) {
        expect(bloc, equals(blocTMP));
      },
    );

    blocTest<HomeBloc, HomeState>(
      '=> GetCharactersEvent Event',
      build: () {
        when(
          () => mockRepository.getCharacters(0),
        ).thenAnswer(
          (_) async => const CharectersResponse<Character>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Character>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );
        return HomeBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(GetCharactersEvent());
      },
      expect: () => [
        GetCharactersLoadingState(blocTMP.state.model),
        GetCharactersLoadedState(
          blocTMP.state.model.copyWith(
            actualPage: 0,
            characters: [],
            totalCharacters: 0,
          ),
        )
      ],
    );

    blocTest<HomeBloc, HomeState>(
      '=> GoToPageEvent Event',
      build: () {
        when(
          () => mockRepository.getCharacters(20),
        ).thenAnswer(
          (_) async => const CharectersResponse<Character>(
            200,
            '',
            '',
            '',
            '',
            '',
            CharectersData<Character>(
              count: 0,
              offset: 0,
              limit: 20,
              total: 0,
              results: [],
            ),
          ),
        );
        return HomeBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GoToPageEvent(1));
      },
      expect: () => [
        GetCharactersLoadingState(blocTMP.state.model),
        GetCharactersLoadedState(
          blocTMP.state.model.copyWith(
            actualPage: 1,
            characters: [],
            totalCharacters: 0,
          ),
        )
      ],
    );

    blocTest<HomeBloc, HomeState>(
      '=> GetCharactersEvent - GetCharactersFailedState State',
      build: () {
        when(
          () => mockRepository.getCharacters(0),
        ).thenThrow(Exception('Error'));
        return HomeBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(GetCharactersEvent());
      },
      expect: () => [
        GetCharactersLoadingState(blocTMP.state.model),
        GetCharactersFailedState(
          blocTMP.state.model,
          'Error',
        )
      ],
    );

    blocTest<HomeBloc, HomeState>(
      '=> GoToPageEvent - GetCharactersFailedState State',
      build: () {
        when(
          () => mockRepository.getCharacters(0),
        ).thenThrow(Exception('Error'));
        return HomeBloc(mockRepository);
      },
      act: (bloc) {
        bloc.add(const GoToPageEvent(1));
      },
      expect: () => [
        GetCharactersLoadingState(blocTMP.state.model),
        GetCharactersFailedState(
          blocTMP.state.model,
          'Error',
        )
      ],
    );
  });
}
