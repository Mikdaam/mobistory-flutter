import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobistory/src/domain/model/event.dart';
import 'package:mobistory/src/domain/repositories/database_repository.dart';

part 'favorite_events_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final DatabaseRepository _databaseRepository;

  FavoritesCubit(this._databaseRepository) : super(FavoritesLoading());

  Future<void> loadFavorites() async {
    emit(await _loadFavorites());
  }

  Future<void> toggleFavorite(Event event) async {
    if (event.isFavorite) {
      await _databaseRepository.removeEventFromFavorites(event);
    } else {
      await _databaseRepository.addEventToFavorites(event);
    }
    emit(await _loadFavorites());
  }

  Future<void> removeEventFromFavorites(Event event) async {
    await _databaseRepository.removeEventFromFavorites(event);
    emit(await _loadFavorites());
  }

  Future<FavoritesState> _loadFavorites() async {
    final events = await _databaseRepository.getFavoriteEvents();
    return FavoritesLoaded(events: events);
  }
}