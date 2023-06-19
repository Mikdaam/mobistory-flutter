// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i7;

import '../../../main.dart' as _i1;
import '../../presentation/views/events.dart' as _i3;
import '../../presentation/views/favorites_events.dart' as _i5;
import '../../presentation/views/today_events.dart' as _i4;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainScreen(),
      );
    },
    EventsRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    TodayRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FavoritesRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EventsScreen(),
      );
    },
    TodayEventsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TodayEventsScreen(),
      );
    },
    FavoritesEventsRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FavoritesEventsScreen(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              EventsRouter.name,
              path: 'events',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(
                  EventsRoute.name,
                  path: '',
                  parent: EventsRouter.name,
                ),
                _i6.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: EventsRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i6.RouteConfig(
              TodayRouter.name,
              path: 'today',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(
                  TodayEventsRoute.name,
                  path: '',
                  parent: TodayRouter.name,
                ),
                _i6.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: TodayRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i6.RouteConfig(
              FavoritesRouter.name,
              path: 'favorites',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(
                  FavoritesEventsRoute.name,
                  path: '',
                  parent: FavoritesRouter.name,
                ),
                _i6.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: FavoritesRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EventsRouter extends _i6.PageRouteInfo<void> {
  const EventsRouter({List<_i6.PageRouteInfo>? children})
      : super(
          EventsRouter.name,
          path: 'events',
          initialChildren: children,
        );

  static const String name = 'EventsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class TodayRouter extends _i6.PageRouteInfo<void> {
  const TodayRouter({List<_i6.PageRouteInfo>? children})
      : super(
          TodayRouter.name,
          path: 'today',
          initialChildren: children,
        );

  static const String name = 'TodayRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FavoritesRouter extends _i6.PageRouteInfo<void> {
  const FavoritesRouter({List<_i6.PageRouteInfo>? children})
      : super(
          FavoritesRouter.name,
          path: 'favorites',
          initialChildren: children,
        );

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [_i3.EventsScreen]
class EventsRoute extends _i6.PageRouteInfo<void> {
  const EventsRoute()
      : super(
          EventsRoute.name,
          path: '',
        );

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i4.TodayEventsScreen]
class TodayEventsRoute extends _i6.PageRouteInfo<void> {
  const TodayEventsRoute()
      : super(
          TodayEventsRoute.name,
          path: '',
        );

  static const String name = 'TodayEventsRoute';
}

/// generated route for
/// [_i5.FavoritesEventsScreen]
class FavoritesEventsRoute extends _i6.PageRouteInfo<void> {
  const FavoritesEventsRoute()
      : super(
          FavoritesEventsRoute.name,
          path: '',
        );

  static const String name = 'FavoritesEventsRoute';
}
