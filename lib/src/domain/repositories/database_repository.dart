import 'package:mobistory/src/domain/model/event.dart';

abstract class DatabaseRepository {
  Future<List<Event>> getEvents();

  Future<Event?> getEvent(int eventId);

  Future<List<Event>> getFavoriteEvents();

  Future<void> addEventToFavorites(Event event);

  Future<void> removeEventFromFavorites(Event event);

  Future<List<Event>> getTodayEvents();

  Future<List<Event>> getNearestEvents(Double latitude, Double longitude, Double radius);

  Stream<int?> getNumberOfEvents();
}