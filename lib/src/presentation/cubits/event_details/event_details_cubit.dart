import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobistory/src/domain/model/event_details.dart';
import 'package:mobistory/src/domain/repositories/api_repository.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';
import 'package:mobistory/src/utils/resources/resource.dart';

part 'event_details_state.dart';

class EventDetailsCubit extends Cubit<EventDetailsState> {
  final DatabaseRepository _databaseRepository;
  final ApiRepository _apiRepository;


  EventDetailsCubit(this._apiRepository, this._databaseRepository) : super(const EventDetailsStateInitial());

  Future<void> getEventDetails(int eventId) async {
    final event = await _databaseRepository.getEvent(eventId);

    emit(const EventDetailsStateLoading());

    final response = await _apiRepository.getEventPageFromWikipedia(extractWikipediaTitle(event?.wikipedia ?? ""));

    if (response is Success) {
      final eventDetails = EventDetails(
        event: event!,
        wikipediaContent: response.data!.query.pages.first.extract,
        images: []
      );

      emit(EventDetailsStateSuccess(eventDetails: eventDetails));
    } else if (response is Failed) {
      emit(EventDetailsStateFailed(error: response.error!));
    }
  }

  String extractWikipediaTitle(String wikipediaUrl) {
    List<String> parts = wikipediaUrl.split("||");
    return parts.length > 1 ? parts[1] : "";
  }
}