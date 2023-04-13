// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeModel themeModel;
  const ThemeState(this.themeModel);

  @override
  List<Object> get props => [themeModel];

  ThemeMode setThemeMode(String? theme) {
    if (theme == ThemeEnum.dark.toString()) {
      return ThemeMode.dark;
    }
    if (theme == ThemeEnum.light.toString()) {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  bool get isDarkModeActivated =>
      setThemeMode(themeModel.theme) == ThemeMode.dark;
}

class ThemeInitial extends ThemeState {
  const ThemeInitial(super.themeModel);
}

class UpdateDarkTheme extends ThemeState {
  const UpdateDarkTheme(super.themeModel);
}

class UpdateLightTheme extends ThemeState {
  const UpdateLightTheme(super.themeModel);
}

class UpdateLanguajeState extends ThemeState {
  const UpdateLanguajeState(super.themeModel);
}

class ThemeModel extends Equatable {
  final String? theme;
  final String languaje;

  const ThemeModel({this.languaje = 'es', this.theme});

  @override
  List<Object?> get props => [
        theme,
        languaje,
      ];

  ThemeModel copyWith({
    String? theme,
    String? languaje,
  }) {
    return ThemeModel(
      theme: theme ?? this.theme,
      languaje: languaje ?? this.languaje,
    );
  }
}
