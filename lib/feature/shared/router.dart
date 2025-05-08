import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/toplist/toplist.dart';
import '../pages/add/add.dart';
import '../pages/detail/detail.dart';
import '../pages/history/history.dart';
import '../pages/detail/history_detail.dart';
import 'bottom_navbar.dart';


class AppRoutes {
  static const home = '/';
  static const add = 'add';
  static const detail = 'detail';
  static const history = '/history';
  static const historyDetail = 'history_detail';
}

const List<NavigationDestinationRoute> destinations = [
  NavigationDestinationRoute(
    route: AppRoutes.home,
    label: 'Home',
    icon: Icon(Icons.home),
  ),
  NavigationDestinationRoute(
    route: AppRoutes.history,
    label: 'History',
    icon: Icon(Icons.history),
  ),
];

class NavigationDestinationRoute {
  const NavigationDestinationRoute({
    required this.route,
    required this.label,
    required this.icon,
  });

  final String route;
  final String label;
  final Icon icon;
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (context, state) => NoTransitionPage(
        child: ScaffoldWithBottomNavBar(
          currentIndex: 0,
          child: TopListPage(),
        ),
      ),
      routes: [
        GoRoute(
          path: AppRoutes.add,
          pageBuilder: (context, state) => NoTransitionPage(
            child: NewDatePage(),
          ),
        ),
        GoRoute(
          path: '${AppRoutes.detail}/:todateId',
          pageBuilder: (context, state) => NoTransitionPage(
            child: DateDetailPage(
              id: state.pathParameters['todateId']
            ),
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.history,
      pageBuilder: (context, state) => NoTransitionPage(
        child: ScaffoldWithBottomNavBar(
          currentIndex: 1, // Should match with destinations[N].index for '/history'
          child: HistoryListPage(),
        ),
      ),
      routes: [
        GoRoute(
          path: '${AppRoutes.historyDetail}/:todateId',
          pageBuilder: (context, state) => NoTransitionPage(
            child: HistoryDetailPage(
              id: state.pathParameters['todateId']
            ),
          ),
        ),
      ],
    ),
  ],
);

