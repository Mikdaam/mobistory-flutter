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
}