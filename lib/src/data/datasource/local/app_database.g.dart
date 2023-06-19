// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EventDao? _eventDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `event` (`id` INTEGER NOT NULL, `label` TEXT, `aliases` TEXT, `description` TEXT, `wikipedia` TEXT, `popularityEN` INTEGER NOT NULL, `popularityFR` INTEGER NOT NULL, `sourceId` INTEGER NOT NULL, `isFavorite` INTEGER NOT NULL, `startTime` INTEGER NOT NULL, `endTime` INTEGER NOT NULL, `pointInTime` INTEGER NOT NULL, `latitude` REAL, `longitude` REAL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EventDao get eventDao {
    return _eventDaoInstance ??= _$EventDao(database, changeListener);
  }
}

class _$EventDao extends EventDao {
  _$EventDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _eventInsertionAdapter = InsertionAdapter(
            database,
            'event',
            (Event item) => <String, Object?>{
                  'id': item.id,
                  'label': item.label,
                  'aliases': item.aliases,
                  'description': item.description,
                  'wikipedia': item.wikipedia,
                  'popularityEN': item.popularityEN,
                  'popularityFR': item.popularityFR,
                  'sourceId': item.sourceId,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'startTime': _dateTimeConverter.encode(item.startTime),
                  'endTime': _dateTimeConverter.encode(item.endTime),
                  'pointInTime': _dateTimeConverter.encode(item.pointInTime),
                  'latitude': item.latitude,
                  'longitude': item.longitude
                }),
        _eventUpdateAdapter = UpdateAdapter(
            database,
            'event',
            ['id'],
            (Event item) => <String, Object?>{
                  'id': item.id,
                  'label': item.label,
                  'aliases': item.aliases,
                  'description': item.description,
                  'wikipedia': item.wikipedia,
                  'popularityEN': item.popularityEN,
                  'popularityFR': item.popularityFR,
                  'sourceId': item.sourceId,
                  'isFavorite': item.isFavorite ? 1 : 0,
                  'startTime': _dateTimeConverter.encode(item.startTime),
                  'endTime': _dateTimeConverter.encode(item.endTime),
                  'pointInTime': _dateTimeConverter.encode(item.pointInTime),
                  'latitude': item.latitude,
                  'longitude': item.longitude
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Event> _eventInsertionAdapter;

  final UpdateAdapter<Event> _eventUpdateAdapter;

  @override
  Future<List<Event>> getAllEvents() async {
    return _queryAdapter.queryList('SELECT * FROM event',
        mapper: (Map<String, Object?> row) => Event(
            id: row['id'] as int,
            label: row['label'] as String?,
            aliases: row['aliases'] as String?,
            description: row['description'] as String?,
            wikipedia: row['wikipedia'] as String?,
            popularityEN: row['popularityEN'] as int,
            popularityFR: row['popularityFR'] as int,
            sourceId: row['sourceId'] as int,
            isFavorite: (row['isFavorite'] as int) != 0,
            startTime: _dateTimeConverter.decode(row['startTime'] as int),
            endTime: _dateTimeConverter.decode(row['endTime'] as int),
            pointInTime: _dateTimeConverter.decode(row['pointInTime'] as int),
            latitude: row['latitude'] as double?,
            longitude: row['longitude'] as double?));
  }

  @override
  Future<List<Event>> getFavoriteEvents() async {
    return _queryAdapter.queryList('SELECT * FROM event WHERE isFavorite = 1',
        mapper: (Map<String, Object?> row) => Event(
            id: row['id'] as int,
            label: row['label'] as String?,
            aliases: row['aliases'] as String?,
            description: row['description'] as String?,
            wikipedia: row['wikipedia'] as String?,
            popularityEN: row['popularityEN'] as int,
            popularityFR: row['popularityFR'] as int,
            sourceId: row['sourceId'] as int,
            isFavorite: (row['isFavorite'] as int) != 0,
            startTime: _dateTimeConverter.decode(row['startTime'] as int),
            endTime: _dateTimeConverter.decode(row['endTime'] as int),
            pointInTime: _dateTimeConverter.decode(row['pointInTime'] as int),
            latitude: row['latitude'] as double?,
            longitude: row['longitude'] as double?));
  }

  @override
  Future<List<Event>> getTodayEvents(DateTime date) async {
    return _queryAdapter.queryList(
        'SELECT * FROM event WHERE startTime == ?1 OR endTime == ?1 OR pointInTime == ?1',
        mapper: (Map<String, Object?> row) => Event(id: row['id'] as int, label: row['label'] as String?, aliases: row['aliases'] as String?, description: row['description'] as String?, wikipedia: row['wikipedia'] as String?, popularityEN: row['popularityEN'] as int, popularityFR: row['popularityFR'] as int, sourceId: row['sourceId'] as int, isFavorite: (row['isFavorite'] as int) != 0, startTime: _dateTimeConverter.decode(row['startTime'] as int), endTime: _dateTimeConverter.decode(row['endTime'] as int), pointInTime: _dateTimeConverter.decode(row['pointInTime'] as int), latitude: row['latitude'] as double?, longitude: row['longitude'] as double?),
        arguments: [_dateTimeConverter.encode(date)]);
  }

  @override
  Stream<int?> getNumberOfEvents() {
    return _queryAdapter.queryStream('SELECT COUNT(*) FROM event',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        queryableName: 'event',
        isView: false);
  }

  @override
  Future<void> insertEvent(Event event) async {
    await _eventInsertionAdapter.insert(event, OnConflictStrategy.ignore);
  }

  @override
  Future<void> updateEvent(Event event) async {
    await _eventUpdateAdapter.update(event, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
