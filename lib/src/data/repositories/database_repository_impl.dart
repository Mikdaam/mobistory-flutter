import 'package:mobistory/src/data/datasource/local/dao/event_dao.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  final EventDao _eventDao;

  DatabaseRepositoryImpl(this._eventDao);

  @override
  Future<List<Event>> getEvents() {
    return _eventDao.getAllEvents();
  }

  @override
  Future<List<Event>> getFavoriteEvents() {
    return _eventDao.getFavoriteEvents();
  }

  @override
  Future<void> addEventToFavorites(Event event) async {
    await _eventDao.updateEvent(event.copyWith(isFavorite: true));
  }

  @override
  Future<void> removeEventFromFavorites(Event event) async {
    await _eventDao.updateEvent(event.copyWith(isFavorite: false));
  }

  @override
  Future<List<Event>> getTodayEvents() {
    final events = _eventDao.getAllEvents();
    final today = DateTime.now();
    // final nullDate = DateTime.parse("0001-01-01");

    final todayEvents = events.then((value) =>
        value.where((element) =>
            element.startTime.month == today.month &&
            element.startTime.day == today.day ||
            element.endTime.month == today.month &&
            element.endTime.day == today.day ||
            element.pointInTime.month == today.month &&
            element.pointInTime.day == today.day
        ).toList()
    );

    return todayEvents;
  }

  @override
  Stream<int?> getNumberOfEvents() {
    return _eventDao.getNumberOfEvents();
  }
}