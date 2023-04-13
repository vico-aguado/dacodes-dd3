part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCharactersEvent extends HomeEvent {}

class GoToPageEvent extends HomeEvent {
  final int page;
  const GoToPageEvent(this.page);
}
