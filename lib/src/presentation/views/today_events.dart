import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/presentation/cubits/today_events/today_events_cubit.dart';
import 'package:mobistory/src/presentation/widgets/event_list_item.dart';

class TodayEventsScreen extends HookWidget {
  const TodayEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Events of the day')),
      body: BlocBuilder<TodayEventsCubit, TodayEventsState>(
        builder: (context, state) {
          if (state is TodayEventsLoading) {
            return _buildLoading();
          } else if (state is TodayEventsLoaded) {
            return _buildLoaded(state.events);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoaded(List<Event> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return EventListItem(
          event: event,
          onItemClick: (event) {},
          onFavoriteClick: null,
        );
      },
    );
  }
}