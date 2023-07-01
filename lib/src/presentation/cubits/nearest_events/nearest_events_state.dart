part of 'nearest_events_cubit.dart';

abstract class NearestEventsState extends Equatable {
  final List<Event> events;

  const NearestEventsState({
    this.events = const <Event>[],
  });

  @override
  List<Object> get props => [events];
}

class NearestEventsLoading extends NearestEventsState {}

class NearestEventsLoaded extends NearestEventsState {
  const NearestEventsLoaded({required List<Event> events}) : super(events: events);
}