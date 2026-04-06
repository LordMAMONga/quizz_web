import 'package:auto_route/auto_route.dart';
import 'package:quizz_web/ui/screens/crossword_screen.dart';
import 'package:quizz_web/ui/screens/final_screen.dart';
import 'package:quizz_web/ui/screens/leaderboard_screen.dart';

import '../../ui/screens/login_screen.dart';
import '../../ui/screens/waiting_screen.dart';
import '../../ui/screens/quizz_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends  RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, path: '/login', initial: true),

    AutoRoute(page: WaitingRoute.page, path: '/waiting'),
    AutoRoute(page: QuizzRoute.page, path: '/quiz'),

    AutoRoute(page: LeaderboardRoute.page, path: '/leaderboard'),
    AutoRoute(page: CrosswordRoute.page, path: '/crossword'),
    AutoRoute(page: FinalRoute.page, path: '/final'),
  ];
}