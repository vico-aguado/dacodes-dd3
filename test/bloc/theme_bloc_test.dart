import 'package:bloc_test/bloc_test.dart';
import 'package:dacodes_dd3/src/ui/bloc/theme_bloc.dart';
import 'package:dacodes_dd3/src/utils/preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('[ Theme Bloc ]', () {
    late Preferences preferences;
    late MockSharedPreferences mockSharedPreferences;
    late ThemeBloc blocTMP;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      preferences = Preferences()..preferences = mockSharedPreferences;
      blocTMP = ThemeBloc(preferences);
    });

    tearDown(() {
      blocTMP.close();
    });

    test('=> Initial call state', () {
      expect(blocTMP.state, const ThemeInitial(ThemeModel()));
    });

    test('=> state', () {
      const state = ThemeInitial(ThemeModel());
      expect(state.isDarkModeActivated, false);
    });

    test('test UpdateLanguajeEvent', () {
      const ThemeEvent event = UpdateLanguajeEvent(languaje: 'es');
      expect(event, equals(const UpdateLanguajeEvent(languaje: 'es')));
      expect(event.props, equals([]));
    });

    test('test UpdateThemeEvent', () {
      const ThemeEvent event = UpdateThemeEvent(isDarkModeActive: true);
      expect(event, equals(const UpdateThemeEvent(isDarkModeActive: true)));
      expect(event.props, equals([]));
    });

    test('test isDarkModeActivated', () {
      const ThemeEvent event = UpdateThemeEvent(isDarkModeActive: true);
      expect(event, equals(const UpdateThemeEvent(isDarkModeActive: true)));
      expect(event.props, equals([]));
    });

    test('test getCurrentLanguaje', () {
      when(() => preferences.getCurrentLanguaje()).thenAnswer((_) => 'es');
      final languaje = preferences.getCurrentLanguaje();
      expect(languaje, 'es');
    });

    test('test getCurrentTheme', () {
      when(() => preferences.getCurrentTheme()).thenAnswer((_) => 'dark');
      final languaje = preferences.getCurrentTheme();
      expect(languaje, 'dark');
    });

    test('test InitEvent', () {
      final event = InitEvent();
      expect(event, equals(InitEvent()));
      expect(event.props, equals([]));
    });

    blocTest<ThemeBloc, ThemeState>(
      '=> Initial Bloc',
      build: () => blocTMP,
      verify: (bloc) {
        expect(bloc, equals(blocTMP));
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      '=> UpdateLanguajeEvent Event',
      build: () {
        when(
          () => preferences.saveCurrentLanguaje('en'),
        ).thenAnswer(
          (_) async => true,
        );

        when(
          () => mockSharedPreferences.setString('languaje', 'en'),
        ).thenAnswer(
          (_) async => true,
        );

        return ThemeBloc(preferences);
      },
      act: (bloc) {
        bloc.add(const UpdateLanguajeEvent(languaje: 'en'));
      },
      expect: () => [
        UpdateLanguajeState(blocTMP.state.themeModel.copyWith(languaje: 'en')),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      '=> UpdateThemeEvent Event - dark',
      build: () {
        when(
          () => preferences.saveCurrentTheme('ThemeEnum.dark'),
        ).thenAnswer(
          (_) async => true,
        );

        when(
          () => mockSharedPreferences.setString('theme', 'ThemeEnum.dark'),
        ).thenAnswer(
          (_) async => true,
        );

        return ThemeBloc(preferences);
      },
      act: (bloc) {
        bloc.add(const UpdateThemeEvent(isDarkModeActive: true));
      },
      expect: () => [
        UpdateLightTheme(
          blocTMP.state.themeModel.copyWith(theme: 'ThemeEnum.dark'),
        ),
      ],
    );

    blocTest<ThemeBloc, ThemeState>(
      '=> UpdateThemeEvent Event - light',
      build: () {
        when(
          () => preferences.saveCurrentTheme('ThemeEnum.light'),
        ).thenAnswer(
          (_) async => true,
        );

        when(
          () => mockSharedPreferences.setString('theme', 'ThemeEnum.light'),
        ).thenAnswer(
          (_) async => true,
        );

        return ThemeBloc(preferences);
      },
      act: (bloc) {
        bloc.add(const UpdateThemeEvent(isDarkModeActive: false));
      },
      expect: () => [
        UpdateDarkTheme(
          blocTMP.state.themeModel.copyWith(theme: 'ThemeEnum.light'),
        ),
      ],
    );
  });
}
