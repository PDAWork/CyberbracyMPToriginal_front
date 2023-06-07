import 'package:cyberbracy_mpt_original_front/domain/entity/calendar_entity.dart';
import 'package:equatable/equatable.dart';

class ConsultDates extends Equatable {
  final DateTime consultDate;
  final List<CalendarEntity> consultDateList;

  const ConsultDates(this.consultDate, this.consultDateList);

  @override
  List<Object?> get props => [consultDate, consultDateList];
}
