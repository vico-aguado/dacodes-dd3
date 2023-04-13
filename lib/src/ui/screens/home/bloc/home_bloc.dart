import 'package:bloc/bloc.dart';
import 'package:dacodes_dd3/src/data/repositories/characters_repository.dart';
import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/utils/environment.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CharactersRepository repository;
  HomeBloc(
    this.repository,
  ) : super(
          const HomeInitialState(
            Model(),
          ),
        ) {
    on<GetCharactersEvent>(_getCharacters);
    on<GoToPageEvent>(_goToPage);
  }

  Future<void> _goToPage(
    GoToPageEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(GetCharactersLoadingState(state.model));

      final result = await repository.getCharacters(event.page * prodEnv.limit);
      final characters = result.data.results;

      emit(
        GetCharactersLoadedState(
          state.model.copyWith(
            characters: characters,
            totalCharacters: result.data.total,
            actualPage: event.page,
          ),
        ),
      );
    } catch (e) {
      emit(GetCharactersFailedState(state.model, e.toString()));
    }
  }

  Future<void> _getCharacters(
    GetCharactersEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(GetCharactersLoadingState(state.model));

      final result = await repository.getCharacters(0);
      final characters = result.data.results;

      emit(
        GetCharactersLoadedState(
          state.model.copyWith(
            characters: characters,
            totalCharacters: result.data.total,
            actualPage: 0,
          ),
        ),
      );
    } catch (e) {
      emit(GetCharactersFailedState(state.model, e.toString()));
    }
  }
}
