import 'package:flutter/material.dart';

import 'src/games/domain/models/game_lite_model.dart';
import 'src/games/presentation/pages/game_details_page.dart';
import 'src/games/presentation/pages/games_page.dart';
import 'src/shared/presentation/pages/splash_page.dart';

// zone splash
const String splashRoute = '/';
// zone games
const String gamesRoute = '/games';
const String gameDetailsRoute = '/game-details';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // splash
      case splashRoute:
        return MaterialPageRoute<void>(
          builder: (context) => const SplashPage(),
        );
      // games
      case gamesRoute:
        return PageRouteBuilder<void>(
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(
                opacity: animation1, child: const GamesPage());
          },
        );
      case gameDetailsRoute:
        return PageRouteBuilder<void>(
          transitionDuration: const Duration(milliseconds: 750),
          pageBuilder: (context, animation1, animation2) {
            return FadeTransition(
                opacity: animation1,
                child: GameDetailsPage(
                    gameLite: settings.arguments as GameLiteModel));
          },
        );
      // default
      default:
        return MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
