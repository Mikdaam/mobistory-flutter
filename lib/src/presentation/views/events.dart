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
                      "${event.startTime.year} - ${event.endTime.year}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  if (event.pointInTime != DateTime.parse("0001-01-01"))
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
