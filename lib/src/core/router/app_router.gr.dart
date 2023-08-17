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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i11;

import '../../../main.dart' as _i1;
import '../../presentation/views/about.dart' as _i9;
import '../../presentation/views/event_details.dart' as _i4;
import '../../presentation/views/events.dart' as _i3;
import '../../presentation/views/favorites_events.dart' as _i6;
import '../../presentation/views/quiz.dart' as _i7;
import '../../presentation/views/settings.dart' as _i8;
import '../../presentation/views/today_events.dart' as _i5;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.MainScreen(key: args.key),
      );
    },
    EventsRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    TodayRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    FavoritesRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    QuizRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    AboutRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EventsScreen(),
      );
    },
    EventDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EventDetailsRouteArgs>(
          orElse: () =>
              EventDetailsRouteArgs(eventId: pathParams.getInt('eventId')));
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.EventDetailsScreen(
          key: args.key,
          eventId: args.eventId,
        ),
      );
    },
    TodayEventsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.TodayEventsScreen(),
      );
    },
    FavoritesEventsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FavoritesEventsScreen(),
      );
    },
    QuizRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.QuizScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsScreen(),
      );
    },
    AboutRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AboutScreen(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              EventsRouter.name,
              path: 'events',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  EventsRoute.name,
                  path: '',
                  parent: EventsRouter.name,
                ),
                _i10.RouteConfig(
                  EventDetailsRoute.name,
                  path: ':eventId',
                  parent: EventsRouter.name,
                ),
                _i10.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: EventsRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i10.RouteConfig(
              TodayRouter.name,
              path: 'today',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  TodayEventsRoute.name,
                  path: '',
                  parent: TodayRouter.name,
                ),
                _i10.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: TodayRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i10.RouteConfig(
              FavoritesRouter.name,
              path: 'favorites',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  FavoritesEventsRoute.name,
                  path: '',
                  parent: FavoritesRouter.name,
                ),
                _i10.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: FavoritesRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i10.RouteConfig(
              QuizRouter.name,
              path: 'quiz',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  QuizRoute.name,
                  path: '',
                  parent: QuizRouter.name,
                ),
                _i10.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: QuizRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i10.RouteConfig(
              SettingsRouter.name,
              path: 'settings',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  SettingsRoute.name,
                  path: '',
                  parent: SettingsRouter.name,
                ),
                _i10.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: SettingsRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i10.RouteConfig(
              AboutRouter.name,
              path: 'about',
              parent: MainRoute.name,
              children: [
                _i10.RouteConfig(
                  AboutRoute.name,
                  path: '',
                  parent: AboutRouter.name,
                ),
                _i10.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: AboutRouter.name,
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
class MainRoute extends _i10.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          path: '/',
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EventsRouter extends _i10.PageRouteInfo<void> {
  const EventsRouter({List<_i10.PageRouteInfo>? children})
      : super(
          EventsRouter.name,
          path: 'events',
          initialChildren: children,
        );

  static const String name = 'EventsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class TodayRouter extends _i10.PageRouteInfo<void> {
  const TodayRouter({List<_i10.PageRouteInfo>? children})
      : super(
          TodayRouter.name,
          path: 'today',
          initialChildren: children,
        );

  static const String name = 'TodayRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FavoritesRouter extends _i10.PageRouteInfo<void> {
  const FavoritesRouter({List<_i10.PageRouteInfo>? children})
      : super(
          FavoritesRouter.name,
          path: 'favorites',
          initialChildren: children,
        );

  static const String name = 'FavoritesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class QuizRouter extends _i10.PageRouteInfo<void> {
  const QuizRouter({List<_i10.PageRouteInfo>? children})
      : super(
          QuizRouter.name,
          path: 'quiz',
          initialChildren: children,
        );

  static const String name = 'QuizRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SettingsRouter extends _i10.PageRouteInfo<void> {
  const SettingsRouter({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRouter.name,
          path: 'settings',
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class AboutRouter extends _i10.PageRouteInfo<void> {
  const AboutRouter({List<_i10.PageRouteInfo>? children})
      : super(
          AboutRouter.name,
          path: 'about',
          initialChildren: children,
        );

  static const String name = 'AboutRouter';
}

/// generated route for
/// [_i3.EventsScreen]
class EventsRoute extends _i10.PageRouteInfo<void> {
  const EventsRoute()
      : super(
          EventsRoute.name,
          path: '',
        );

  static const String name = 'EventsRoute';
}

/// generated route for
/// [_i4.EventDetailsScreen]
class EventDetailsRoute extends _i10.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i11.Key? key,
    required int eventId,
  }) : super(
          EventDetailsRoute.name,
          path: ':eventId',
          args: EventDetailsRouteArgs(
            key: key,
            eventId: eventId,
          ),
          rawPathParams: {'eventId': eventId},
        );

  static const String name = 'EventDetailsRoute';
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    this.key,
    required this.eventId,
  });

  final _i11.Key? key;

  final int eventId;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i5.TodayEventsScreen]
class TodayEventsRoute extends _i10.PageRouteInfo<void> {
  const TodayEventsRoute()
      : super(
          TodayEventsRoute.name,
          path: '',
        );

  static const String name = 'TodayEventsRoute';
}

/// generated route for
/// [_i6.FavoritesEventsScreen]
class FavoritesEventsRoute extends _i10.PageRouteInfo<void> {
  const FavoritesEventsRoute()
      : super(
          FavoritesEventsRoute.name,
          path: '',
        );

  static const String name = 'FavoritesEventsRoute';
}

/// generated route for
/// [_i7.QuizScreen]
class QuizRoute extends _i10.PageRouteInfo<void> {
  const QuizRoute()
      : super(
          QuizRoute.name,
          path: '',
        );

  static const String name = 'QuizRoute';
}

/// generated route for
/// [_i8.SettingsScreen]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i9.AboutScreen]
class AboutRoute extends _i10.PageRouteInfo<void> {
  const AboutRoute()
      : super(
          AboutRoute.name,
          path: '',
        );

  static const String name = 'AboutRoute';
}
