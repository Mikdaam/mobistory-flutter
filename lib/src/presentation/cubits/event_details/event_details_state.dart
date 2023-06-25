part of 'event_details_cubit.dart';

abstract class EventDetailsState extends Equatable {
  final EventDetails? eventDetails;
  final bool isLoading;
  final DioException? error;

  const EventDetailsState({
    this.eventDetails,
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [eventDetails];
}

class EventDetailsStateInitial extends EventDetailsState {
  const EventDetailsStateInitial() : super();
}

class EventDetailsStateLoading extends EventDetailsState {
  const EventDetailsStateLoading() : super(isLoading: true);
}

class EventDetailsStateSuccess extends EventDetailsState {
  const EventDetailsStateSuccess({ required EventDetails eventDetails }) : super(eventDetails: eventDetails);
}

class EventDetailsStateFailed extends EventDetailsState {
  const EventDetailsStateFailed({ required DioException error }) : super(error: error);
}