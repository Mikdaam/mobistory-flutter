import 'package:floor/floor.dart';
import 'package:mobistory/src/domain/model/event.dart';

@dao
abstract class EventDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertEvent(Event event);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateEvent(Event event);

  @Query('SELECT * FROM event')
  Future<List<Event>> getAllEvents();

  @Query('SELECT * FROM event WHERE isFavorite = 1')
  Future<List<Event>> getFavoriteEvents();

  @Query('SELECT * FROM event WHERE startTime == :date OR endTime == :date OR pointInTime == :date')
  Future<List<Event>> getTodayEvents(DateTime date);

  @Query('SELECT COUNT(*) FROM event')
  Stream<int?> getNumberOfEvents();
}