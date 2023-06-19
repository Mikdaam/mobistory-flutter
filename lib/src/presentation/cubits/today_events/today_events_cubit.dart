import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';

part 'today_events_state.dart';

class TodayEventsCubit extends Cubit<TodayEventsState> {
  final DatabaseRepository _databaseRepository;

  TodayEventsCubit(this._databaseRepository) : super(TodayEventsLoading());

  Future<void> loadTodayEvents() async {
    emit(await _loadTodayEvents());
  }

  Future<TodayEventsState> _loadTodayEvents() async {
    final events = await _databaseRepository.getTodayEvents();
    return TodayEventsLoaded(events: events);
  }
}