part of 'events_cubit.dart';

abstract class EventsState extends Equatable {
  final List<Event> events;

  const EventsState({
    this.events = const <Event>[],
  });

  @override
  List<Object> get props => [events];
}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  const EventsLoaded({required List<Event> events}) : super(events: events);
}