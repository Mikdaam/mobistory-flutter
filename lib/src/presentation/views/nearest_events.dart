import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/presentation/cubits/events/events_cubit.dart';
import 'package:mobistory/src/presentation/cubits/favorite_events/favorite_events_cubit.dart';
import 'package:mobistory/src/presentation/cubits/nearest_events/nearest_events_cubit.dart';
import 'package:mobistory/src/presentation/widgets/event_list_item.dart';

class NearestEventsScreen extends HookWidget {
  const NearestEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearest Events')),
      body: BlocBuilder<NearestEventsCubit, NearestEventsState>(
        builder: (context, state) {
          if (state is NearestEventsLoading) {
            return _buildLoading();
          } else if (state is NearestEventsLoaded) {
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
          onFavoriteClick: (event) {},
        );
      },
    );
  }
}