part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class UpdateThemeEvent extends ThemeEvent {
  final bool isDarkModeActive;

  const UpdateThemeEvent({
    required this.isDarkModeActive,
  });
}

class UpdateLanguajeEvent extends ThemeEvent {
  final String languaje;

  const UpdateLanguajeEvent({
    required this.languaje,
  });
}

class InitEvent extends ThemeEvent {}
