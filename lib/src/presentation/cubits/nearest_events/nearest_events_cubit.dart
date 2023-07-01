import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';

part 'nearest_events_state.dart';

class NearestEventsCubit extends Cubit<NearestEventsState> {
  final DatabaseRepository _databaseRepository;

  NearestEventsCubit(this._databaseRepository) : super(NearestEventsLoading());

  Future<void> loadNearestEvents() async {
    emit(await _loadNearestEvents());
  }

  Future<NearestEventsState> _loadNearestEvents() async {
    final events = await _databaseRepository.getNearestEvents(48.8584, 2.2945, 100);
    return NearestEventsLoaded(events: events);
  }
}