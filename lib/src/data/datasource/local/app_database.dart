import 'package:mobistory/src/data/datasource/local/converter/dateTime_converter.dart';
import 'package:mobistory/src/data/datasource/local/dao/event_dao.dart';
import 'package:mobistory/src/domain/model/event.dart';

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // Generated file

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [Event])
abstract class AppDatabase extends FloorDatabase {
  EventDao get eventDao;
}

/*final prefillCallback = Callback(
  onCreate: (database, version) async {
    final appDatabase =  database;
    final lines = await rootBundle.loadString('assets/events.json');
    final jsonList = LineSplitter.split(lines).toList();

    for (final json in jsonList) {
      final event = Event.fromJson(jsonDecode(json));
      await appDatabase.eventDao.insertEvent(event);
    }
  },
);*/