import 'package:bloc/bloc.dart';
import 'package:dacodes_dd3/src/data/repositories/characters_repository.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/domain/models/event_model.dart';
import 'package:dacodes_dd3/src/domain/models/series_model.dart';
import 'package:dacodes_dd3/src/domain/models/story_model.dart';
import 'package:equatable/equatable.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final CharactersRepository repository;
  DetailBloc(
    this.repository,
  ) : super(
          const DetailInitialState(
            Model(),
            DetailType.none,
          ),
        ) {
    on<GetSectionsEvent>(_getSections);
    on<GetComicsEvent>(_getComics);
    on<GetSeriesEvent>(_getSeries);
    on<GetEventsEvent>(_getEvents);
    on<GetStoriesEvent>(_getStories);
  }

  Future<void> _getSections(
    GetSectionsEvent event,
    Emitter<DetailState> emit,
  ) async {
    add(GetComicsEvent(event.characterID));
    await Future.delayed(const Duration(milliseconds: 500), () {});
    add(GetSeriesEvent(event.characterID));
    await Future.delayed(const Duration(milliseconds: 500), () {});
    add(GetEventsEvent(event.characterID));
    await Future.delayed(const Duration(milliseconds: 500), () {});
    add(GetStoriesEvent(event.characterID));
  }

  Future<void> _getComics(
    GetComicsEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(GetDataLoadingState(state.model, DetailType.comics));

      final result =
          await repository.getComics(event.characterID.toString(), 0);
      final comics = result.data.results;

      emit(
        GetDataLoadedState(
          state.model.copyWith(comics: comics),
          DetailType.comics,
        ),
      );
    } catch (e) {
      emit(GetDataFailedState(state.model, DetailType.comics, e.toString()));
    }
  }

  Future<void> _getSeries(
    GetSeriesEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(GetDataLoadingState(state.model, DetailType.series));

      final result =
          await repository.getSeries(event.characterID.toString(), 0);
      final series = result.data.results;

      emit(
        GetDataLoadedState(
          state.model.copyWith(series: series),
          DetailType.series,
        ),
      );
    } catch (e) {
      emit(GetDataFailedState(state.model, DetailType.series, e.toString()));
    }
  }

  Future<void> _getEvents(
    GetEventsEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(GetDataLoadingState(state.model, DetailType.events));

      final result =
          await repository.getEvents(event.characterID.toString(), 0);
      final events = result.data.results;

      emit(
        GetDataLoadedState(
          state.model.copyWith(events: events),
          DetailType.events,
        ),
      );
    } catch (e) {
      emit(GetDataFailedState(state.model, DetailType.events, e.toString()));
    }
  }

  Future<void> _getStories(
    GetStoriesEvent event,
    Emitter<DetailState> emit,
  ) async {
    try {
      emit(GetDataLoadingState(state.model, DetailType.stories));

      final result =
          await repository.getStories(event.characterID.toString(), 0);
      final stories = result.data.results;

      emit(
        GetDataLoadedState(
          state.model.copyWith(stories: stories),
          DetailType.stories,
        ),
      );
    } catch (e) {
      emit(GetDataFailedState(state.model, DetailType.stories, e.toString()));
    }
  }
}
