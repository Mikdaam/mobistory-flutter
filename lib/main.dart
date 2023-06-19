import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobistory/src/core/router/app_router.gr.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';
import 'package:mobistory/src/locator.dart';
import 'package:mobistory/src/presentation/cubits/events/events_cubit.dart';
import 'package:mobistory/src/presentation/cubits/favorite_events/favorite_events_cubit.dart';
import 'package:mobistory/src/presentation/cubits/today_events/today_events_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => EventsCubit(
                locator<DatabaseRepository>(),
              )..loadEvents()
          ),
          BlocProvider(
              create: (context) => FavoritesCubit(
                locator<DatabaseRepository>(),
              )..loadFavorites()
          ),
          BlocProvider(
              create: (context) => TodayEventsCubit(
                locator<DatabaseRepository>(),
              )..loadTodayEvents()
          )
        ],
        child: MaterialApp.router(
          title: 'Mobistory',
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}

class MainScreen extends HookWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      /*appBarBuilder: (_, tabsRouter) => AppBar(
        title: const Text('Mobistory'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        leading: const AutoLeadingButton(),
      ),*/
      routes: const [
        EventsRouter(),
        TodayRouter(),
        FavoritesRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.lime),
          selectedItemColor: Colors.lime,
          unselectedIconTheme: const IconThemeData(color: Colors.black87),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_edu),
                label: 'Events of the day'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorites'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.quiz_outlined),
                label: 'Quiz'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings'
            ),
          ],
        );
      },
    );
  }
}

