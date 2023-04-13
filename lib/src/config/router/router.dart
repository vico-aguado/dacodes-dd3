import 'package:dacodes_dd3/src/domain/models/character_model.dart';
import 'package:dacodes_dd3/src/domain/models/comics_model.dart';
import 'package:dacodes_dd3/src/ui/screens/comic/comic_screen.dart';
import 'package:dacodes_dd3/src/ui/screens/detail/detail_screen.dart';
import 'package:dacodes_dd3/src/ui/screens/home/home_screen.dart';
import 'package:dacodes_dd3/src/ui/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String initial = '/';
  static const String home = '/home';
  static const String detail = '/detail';
  static const String comic = '/comic';
  static const String splash = '/splash';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case initial:
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case home:
        return AppFadeRoute(
          widget: const HomeScreen(),
          name: '/home',
        );

      case detail:
        {
          Character? character;
          if (args is Character) {
            character = args;
            return AppSlideRoute(
              widget: DetailScreen(character: character),
              name: '/detail',
            );
          }

          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text(
                  'No route defined for $args',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

      case comic:
        {
          Comic? comic;
          if (args is Comic) {
            comic = args;
            return AppSlideRoute(
              widget: ComicScreen(comic: comic),
              name: '/comic',
            );
          }

          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text(
                  'No route defined for $args',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
    }
  }
}

//--------------------------------------------------------------------------

class AppFadeRoute extends PageRouteBuilder<dynamic> {
  final Widget widget;
  final int duration;
  final String name;
  final Object? arguments;

  @override
  Duration get transitionDuration => Duration(milliseconds: duration);

  AppFadeRoute({
    required this.widget,
    this.duration = 300,
    required this.name,
    this.arguments,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0, end: 1).animate(animation),
              child: child,
            );
          },
          settings: RouteSettings(name: name, arguments: arguments),
        );
}

//--------------------------------------------------------------------------

class AppSlideRoute extends CupertinoPageRoute<dynamic> {
  final Widget widget;
  final int duration;
  final String name;
  final Object? arguments;

  @override
  Duration get transitionDuration => Duration(milliseconds: duration);

  AppSlideRoute({
    required this.widget,
    this.duration = 400,
    required this.name,
    this.arguments,
  }) : super(
          builder: (context) {
            return widget;
          },
          settings: RouteSettings(name: name, arguments: arguments),
        );
}
