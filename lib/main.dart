import 'package:dacodes_dd3/generated/l10n.dart';
import 'package:dacodes_dd3/src/config/router/router.dart';
import 'package:dacodes_dd3/src/config/theme/theme.dart';
import 'package:dacodes_dd3/src/data/repositories/characters_repository.dart';
import 'package:dacodes_dd3/src/data/sources/remote/characters_source.dart';
import 'package:dacodes_dd3/src/data/sources/remote/remote_source.dart';
import 'package:dacodes_dd3/src/ui/bloc/theme_bloc.dart';
import 'package:dacodes_dd3/src/utils/environment.dart';
import 'package:dacodes_dd3/src/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  runApp(SuperHeoresApp());
}

class SuperHeoresApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  SuperHeoresApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CharactersRepository(
        charactersApi: CharacterRemoteSource(
          RemoteSource(prodEnv),
          prodEnv,
        ),
      ),
      child: BlocProvider(
        create: (context) => ThemeBloc(preferences),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'DaCodes<>DD3',
              navigatorKey: _navigatorKey,
              darkTheme: ThemeDataDD3.darkTheme,
              theme: ThemeDataDD3.lightTheme,
              themeMode: state.setThemeMode(
                state.themeModel.theme ?? preferences.getCurrentTheme(),
              ),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(state.themeModel.languaje),
              onGenerateInitialRoutes: (initialRoute) => [
                AppRouter.generateRoute(
                  RouteSettings(
                    name: initialRoute,
                  ),
                )
              ],
              initialRoute: AppRouter.splash,
              onGenerateRoute: AppRouter.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
