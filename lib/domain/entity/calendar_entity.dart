import 'package:equatable/equatable.dart';

class CalendarEntity extends Equatable {
  final DateTime dateTime;
  final bool busy;

  const CalendarEntity(this.dateTime, this.busy);

  @override
  List<Object?> get props => [];
}
