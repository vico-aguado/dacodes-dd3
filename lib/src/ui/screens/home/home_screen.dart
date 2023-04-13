import 'package:dacodes_dd3/generated/l10n.dart';
import 'package:dacodes_dd3/src/config/theme/colors_theme.dart';
import 'package:dacodes_dd3/src/data/repositories/characters_repository.dart';
import 'package:dacodes_dd3/src/ui/bloc/theme_bloc.dart';
import 'package:dacodes_dd3/src/ui/screens/home/bloc/home_bloc.dart';
import 'package:dacodes_dd3/src/ui/screens/home/widgets/home_body_widget.dart';
import 'package:dacodes_dd3/src/ui/widgets/loading_widget.dart';
import 'package:dacodes_dd3/src/ui/widgets/text_widget.dart';
import 'package:dacodes_dd3/src/utils/environment.dart';
import 'package:dacodes_dd3/src/utils/keys.dart';
import 'package:dacodes_dd3/src/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = RepositoryProvider.of<CharactersRepository>(context);

    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(repository)
        ..add(
          GetCharactersEvent(),
        ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    TextWidget(
                      text: S.current.charactersTitle,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const Spacer(),
                    BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        state.setThemeMode(
                          preferences.getCurrentTheme(),
                        );

                        final isDark = state.themeModel.theme == null
                            ? state.setThemeMode(
                                  preferences.getCurrentTheme(),
                                ) ==
                                ThemeMode.dark
                            : state.isDarkModeActivated;

                        return Row(
                          children: [
                            IconButton(
                              key: AppKeys.languajeButtonKey,
                              onPressed: () {
                                context.read<ThemeBloc>().add(
                                      UpdateLanguajeEvent(
                                        languaje:
                                            state.themeModel.languaje == 'es'
                                                ? 'en'
                                                : 'es',
                                      ),
                                    );
                              },
                              icon: Text(
                                state.themeModel.languaje == 'es'
                                    ? '🇺🇸'
                                    : '🇲🇽',
                                style: const TextStyle(fontSize: 27),
                              ),
                            ),
                            IconButton(
                              key: AppKeys.themeButtonKey,
                              onPressed: () {
                                context.read<ThemeBloc>().add(
                                      UpdateThemeEvent(
                                        isDarkModeActive: !isDark,
                                      ),
                                    );
                              },
                              icon: Icon(
                                !isDark ? Icons.dark_mode : Icons.light_mode,
                                color: isDark
                                    ? DD3Colors.background
                                    : DD3Colors.primary,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final totalPages =
                          (state.model.totalCharacters / prodEnv.limit).round();

                      return state is GetCharactersLoadingState ||
                              totalPages <= 0
                          ? const LoadingWidget(
                              size: 200,
                            )
                          : HomeBodyWidget(
                              itemsCount: state.model.characters.length,
                              items: state.model.characters,
                              pageActual: state.model.actualPage,
                              totalItems: state.model.totalCharacters,
                              onPageChange: (value) {
                                BlocProvider.of<HomeBloc>(context)
                                    .add(GoToPageEvent(value));
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
