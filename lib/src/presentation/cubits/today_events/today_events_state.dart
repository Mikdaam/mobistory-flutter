part of 'today_events_cubit.dart';

abstract class TodayEventsState extends Equatable {
  final List<Event> events;

  const TodayEventsState({
    this.events = const <Event>[],
  });

  @override
  List<Object> get props => [events];
}

class TodayEventsLoading extends TodayEventsState {}

class TodayEventsLoaded extends TodayEventsState {
  const TodayEventsLoaded({required List<Event> events}) : super(events: events);
}