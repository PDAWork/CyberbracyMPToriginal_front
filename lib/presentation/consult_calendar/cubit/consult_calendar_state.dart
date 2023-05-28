part of 'consult_calendar_cubit.dart';

abstract class ConsultCalendarState extends Equatable {
  const ConsultCalendarState();

  @override
  List<Object> get props => [];
}

class ConsultCalendarInitial extends ConsultCalendarState {}

class ConsultCalendarError extends ConsultCalendarState {
  final String errorMessage;

  const ConsultCalendarError(this.errorMessage);
}

class ConsultCalendarLoaded extends ConsultCalendarState {
  final List<ConsultDates> dates;

  const ConsultCalendarLoaded(this.dates);
}
