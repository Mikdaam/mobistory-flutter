import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mobistory/src/data/datasource/local/app_database.dart';
import 'package:mobistory/src/data/repositories/database_repository_impl.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';
import 'package:mobistory/src/utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> _fillFromJSON (AppDatabase appDatabase) async {
  final lines = await rootBundle.loadString('assets/events.json');
  final jsonList = LineSplitter.split(lines).toList();

  for (final json in jsonList) {
    final event = Event.fromJson(jsonDecode(json));
    await appDatabase.eventDao.insertEvent(event);
  }
}

Future<void> initializeLocator() async {
  final appDatabase = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  _fillFromJSON(appDatabase);
  locator.registerSingleton<AppDatabase>(appDatabase);

  locator.registerSingleton<DatabaseRepository>(
      DatabaseRepositoryImpl(locator<AppDatabase>().eventDao)
  );
}