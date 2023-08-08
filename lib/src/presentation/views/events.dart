import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobistory/src/core/router/app_router.gr.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/presentation/cubits/events/events_cubit.dart';
import 'package:mobistory/src/presentation/cubits/favorite_events/favorite_events_cubit.dart';
import 'package:mobistory/src/presentation/widgets/event_list_item.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class EventsScreen extends HookWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    useEffect(() {
      context.read<EventsCubit>().loadEvents();
      return () {};
    }, []);

    return DefaultTabController(
      length: 2, // This is the number of tabs.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
          bottom: const TabBar(
            tabs: [
                Tab(text: 'List'),
                Tab(text: 'Timeline'),
              ],
            labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                      useRootNavigator: true,
                  );
                },
                icon: const Icon(Icons.search_outlined)
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined)
            )
          ],
        ),
        body: BlocBuilder<EventsCubit, EventsState>(
            builder: (context, state) => TabBarView(
              children: [
                _buildEventsList(context, state),
                _buildEventsTimeline(context, state),
              ],
            )),
      ),
    );
  }

  _buildEventsList(BuildContext context, EventsState state) {
    if (state is EventsLoading) {
      return _buildLoading();
    } else if (state is EventsLoaded) {
      return _buildList(state.events);
    } else {
      return Container(
        color: Colors.red,
        child: const Center(
          child: Text('Something went wrong!'),
        ),
      );
    }
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  _buildEventsTimeline(BuildContext context, EventsState state) {
    if (state is EventsLoading) {
      return _buildLoading();
    } else if (state is EventsLoaded) {
      return _buildTimeline(state.events);
    } else {
      return Container(
        color: Colors.lime,
        child: const Center(
          child: Text('Something went wrong!'),
        ),
      );
    }
  }

  Widget _buildTimeline(List<Event> events) {
    final eventsCopy = [...events];
    eventsCopy.sort((a, b) {
      var dateA = a.startTime == DateTime.parse("0001-01-01") ? a.pointInTime : a.startTime;
      var dateB = b.startTime == DateTime.parse("0001-01-01") ? b.pointInTime : b.startTime;
      return dateA.compareTo(dateB);
    });
    return Timeline.builder(
      itemBuilder: (context, index) {
        final event = eventsCopy[index];
        return TimelineModel(
          Card(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (event.image != null)
                    if (event.image!.endsWith(".svg"))
                      SvgPicture.network(
                        event.image!,
                        fit: BoxFit.fitWidth,
                        // width: 100,
                        height: 100,
                        placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(),
                      )
                    else
                      Image.network(
                        event.image!,
                        fit: BoxFit.fitWidth,
                        // width: 100,
                        height: 100,
                      ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    event.label!,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  if (event.startTime != DateTime.parse("0001-01-01"))
                    Text(
                      "${event.startTime.year}/${event.startTime.month} - ${event.endTime.year}/${event.endTime.month}",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  else
                    Text(
                      "${event.pointInTime.year}/${event.pointInTime.month}/${event.pointInTime.day}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ),
          position: index % 2 == 0
              ? TimelineItemPosition.right
              : TimelineItemPosition.left,
          isFirst: index == 0,
          isLast: index == events.length - 1,
          // random color for now
          iconBackground: Color((Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
          icon: const Icon(Icons.timelapse_outlined, color: Colors.white),
        );
      },
      itemCount: events.length,
      physics: const ClampingScrollPhysics(),
      position: TimelinePosition.Center,
    );
  }
}

Widget _buildList(List<Event> events) {
  return ListView.builder(
    itemCount: events.length,
    itemBuilder: (context, index) {
      final event = events[index];
      return EventListItem(
        event: event,
        onItemClick: (event) => context.router.push(EventDetailsRoute(eventId: event.id)),
        onFavoriteClick: (event) {
          context.read<FavoritesCubit>().toggleFavorite(event);
          context.read<EventsCubit>().loadEvents();
        },
      );
    },
  );
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.characters.isNotEmpty)
        IconButton(
            onPressed: () {
              query = '';
            },
            icon: const Icon(Icons.clear_outlined)
        )
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(85.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white70,
              width: 1.0,
            ),
          ),
        ),
        child: Wrap(
          spacing: 5.0,
          children: const [
            Chip(label: Text("Title"), avatar: Icon(Icons.title), backgroundColor: Colors.white70),
            Chip(label: Text('Start Date'), avatar: Icon(Icons.calendar_today), backgroundColor: Colors.white70),
            Chip(label: Text('End Date'), avatar: Icon(Icons.calendar_today), backgroundColor: Colors.white70),
            Chip(label: Text('Location'), avatar: Icon(Icons.location_on), backgroundColor: Colors.white70),
            Chip(label: Text('Tag'), avatar: Icon(Icons.tag), backgroundColor: Colors.white70),
          ],
        ),
      ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_outlined)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
        // builder: (context, state) => _buildList(state.events.where((event) => event.label!.toLowerCase().contains(query.toLowerCase())).toList())
        builder: (context, state) => _buildList(state.events)
    );
  }
}
