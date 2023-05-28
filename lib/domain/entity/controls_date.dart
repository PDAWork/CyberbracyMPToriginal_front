import 'package:equatable/equatable.dart';

class ConsultDates extends Equatable {
  final DateTime consultDate;
  final List<DateTime> consultDateList;

  const ConsultDates(this.consultDate, this.consultDateList);

  @override
  List<Object?> get props => [consultDate, consultDateList];
}
