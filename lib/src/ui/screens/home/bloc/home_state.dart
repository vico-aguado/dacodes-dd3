// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final Model model;
  const HomeState(this.model);

  @override
  List<Object> get props => [model];
}

class HomeInitialState extends HomeState {
  const HomeInitialState(super.model);
}

class GetCharactersLoadingState extends HomeState {
  const GetCharactersLoadingState(super.model);
}

class GetCharactersLoadedState extends HomeState {
  const GetCharactersLoadedState(super.model);
}

class GetCharactersFailedState extends HomeState {
  final String error;
  const GetCharactersFailedState(super.model, this.error);
}

class Model extends Equatable {
  final List<Character> characters;
  final int totalCharacters;
  final int actualPage;

  const Model({
    this.characters = const [],
    this.totalCharacters = 0,
    this.actualPage = 0,
  });

  Model copyWith({
    List<Character>? characters,
    int? totalCharacters,
    int? actualPage,
  }) {
    return Model(
      characters: characters ?? this.characters,
      totalCharacters: totalCharacters ?? this.totalCharacters,
      actualPage: actualPage ?? this.actualPage,
    );
  }

  @override
  List<Object> get props => [
        characters,
        totalCharacters,
        actualPage,
      ];
}
