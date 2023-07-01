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

  @Query('SELECT * FROM event WHERE id = :id')
  Future<Event?> getEventById(int id);

  @Query('SELECT * FROM event WHERE isFavorite = 1')
  Future<List<Event>> getFavoriteEvents();

  @Query('SELECT * FROM event WHERE startTime == :date OR endTime == :date OR pointInTime == :date')
  Future<List<Event>> getTodayEvents(DateTime date);

  @Query("SELECT * FROM event WHERE (latitude IS NOT NULL) AND (:cosDistance > :cosRadius) ORDER BY :cosDistance DESC")
  Future<List<Event>> getNearestEvents(double cosRadius, String cosDistance);

  @Query('SELECT COUNT(*) FROM event')
  Stream<int?> getNumberOfEvents();
}