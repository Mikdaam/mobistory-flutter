part of 'favorite_events_cubit.dart';

abstract class FavoritesState extends Equatable {
  final List<Event> events;

  const FavoritesState({
    this.events = const <Event>[],
  });

  @override
  List<Object> get props => [events];
}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded({required List<Event> events}) : super(events: events);
}