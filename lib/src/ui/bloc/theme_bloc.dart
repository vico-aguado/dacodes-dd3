import 'package:bloc/bloc.dart';
import 'package:dacodes_dd3/src/utils/preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

enum ThemeEnum {
  dark,
  light;
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final Preferences preferences;
  ThemeBloc(this.preferences)
      : super(
          const ThemeInitial(
            ThemeModel(),
          ),
        ) {
    on<UpdateThemeEvent>(_updateTheme);
    on<UpdateLanguajeEvent>(_updateLanguaje);
  }

  Future<void> _updateLanguaje(
    UpdateLanguajeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    preferences.saveCurrentLanguaje(event.languaje);

    emit(
      UpdateLanguajeState(
        state.themeModel.copyWith(
          languaje: event.languaje,
        ),
      ),
    );
  }

  void _updateTheme(
    UpdateThemeEvent event,
    Emitter<ThemeState> emit,
  ) {
    final themeEnum = event.isDarkModeActive
        ? ThemeEnum.dark.toString()
        : ThemeEnum.light.toString();

    preferences.saveCurrentTheme(themeEnum);

    if (event.isDarkModeActive) {
      emit.call(
        UpdateLightTheme(
          state.themeModel.copyWith(
            theme: themeEnum,
          ),
        ),
      );
      return;
    }
    emit.call(
      UpdateDarkTheme(
        state.themeModel.copyWith(
          theme: themeEnum,
        ),
      ),
    );
  }
}
