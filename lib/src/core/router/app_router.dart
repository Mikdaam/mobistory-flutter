import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:mobistory/main.dart';
import 'package:mobistory/src/presentation/views/events.dart';
import 'package:mobistory/src/presentation/views/favorites_events.dart';
import 'package:mobistory/src/presentation/views/today_events.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: "/",
      page: MainScreen,
      children: [
        AutoRoute(
          path: "events",
          name: "EventsRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: EventsScreen),
            //AutoRoute(path: ':eventId', page: EmptyRouterPage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "today",
          name: "TodayRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: TodayEventsScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "favorites",
          name: "FavoritesRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: FavoritesEventsScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}