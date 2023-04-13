// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  final Model model;
  final DetailType section;
  const DetailState(this.model, this.section);

  @override
  List<Object> get props => [model, section];
}

class DetailInitialState extends DetailState {
  const DetailInitialState(super.model, super.section);
}

class GetDataLoadingState extends DetailState {
  const GetDataLoadingState(super.model, super.section);
}

class GetDataLoadedState extends DetailState {
  const GetDataLoadedState(super.model, super.section);
}

class GetDataFailedState extends DetailState {
  final String error;
  const GetDataFailedState(super.model, super.section, this.error);
}

class Model extends Equatable {
  final List<Comic> comics;
  final List<Serie> series;
  final List<Event> events;
  final List<Story> stories;

  const Model({
    this.comics = const [],
    this.series = const [],
    this.events = const [],
    this.stories = const [],
  });

  Model copyWith({
    List<Comic>? comics,
    List<Serie>? series,
    List<Event>? events,
    List<Story>? stories,
  }) {
    return Model(
      comics: comics ?? this.comics,
      series: series ?? this.series,
      events: events ?? this.events,
      stories: stories ?? this.stories,
    );
  }

  @override
  List<Object> get props => [
        comics,
        series,
        events,
        stories,
      ];
}

enum DetailType { comics, series, events, stories, none }
