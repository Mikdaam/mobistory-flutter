import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  final DatabaseRepository _databaseRepository;

  EventsCubit(this._databaseRepository) : super(EventsLoading());

  Future<void> loadEvents() async {
    emit(await _loadEvents());
  }

  Future<EventsState> _loadEvents() async {
    final events = await _databaseRepository.getEvents();
    return EventsLoaded(events: events);
  }

  void sortByTitle() {
    if (state is EventsLoaded) {
      // get the events from the current state
      final events = (state as EventsLoaded).events;
      // emit a loading state
      emit(EventsLoading());
      // sort the events by title
      events.sort((a, b) => a.labelEN!.compareTo(b.labelEN!));
      // emit the new state with the sorted events
      emit(EventsLoaded(events: events));
    }
  }

  void sortByStartDate() {
    if (state is EventsLoaded) {
      // get the events from the current state
      final events = (state as EventsLoaded).events;
      // emit a loading state
      emit(EventsLoading());
      // sort the events by start date
      events.sort((a, b) {
        var dateA = a.startTime == DateTime.parse("0001-01-01") ? a.pointInTime : a.startTime;
        var dateB = b.startTime == DateTime.parse("0001-01-01") ? b.pointInTime : b.startTime;
        return dateA.compareTo(dateB);
      });
      // emit the new state with the sorted events
      emit(EventsLoaded(events: events));
    }
  }

  void sortByEndDate() {
    if (state is EventsLoaded) {
      // get the events from the current state
      final events = (state as EventsLoaded).events;
      // emit a loading state
      emit(EventsLoading());
      // sort the events by end date
      events.sort((a, b) {
        var dateA = a.endTime == DateTime.parse("0001-01-01") ? a.pointInTime : a.endTime;
        var dateB = b.endTime == DateTime.parse("0001-01-01") ? b.pointInTime : b.endTime;
        return dateA.compareTo(dateB);
      });
      // emit the new state with the sorted events
      emit(EventsLoaded(events: events));
    }
  }

  void sortByPopularity() {
    if (state is EventsLoaded) {
      // get the events from the current state
      final events = (state as EventsLoaded).events;
      // emit a loading state
      emit(EventsLoading());
      // sort the events by popularity
      events.sort((a, b) => a.popularityEN.compareTo(b.popularityEN));
      // emit the new state with the sorted events
      emit(EventsLoaded(events: events));
    }
  }
}