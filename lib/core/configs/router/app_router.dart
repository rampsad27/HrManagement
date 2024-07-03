import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hr_management/ui/screens/log_in_screen.dart';
import 'package:hr_management/ui/screens/user_detail_screen.dart';
import 'package:hr_management/presentation/user_details/user_list_screen.dart.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: "/",
    navigatorKey: navigatorKey,
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (context, state) => const LogInScreen(),
          routes: [
            GoRoute(
                path: 'userlist',
                builder: (context, state) => const UserListScreen(),
                routes: [
                  GoRoute(
                    path: 'userdetail',
                    builder: (context, state) {
                      final userId = state.extra as String;
                      return UserDetailScreen(userId: userId);
                    },
                  ),
                ]),
          ]),
    ],
  );
}
