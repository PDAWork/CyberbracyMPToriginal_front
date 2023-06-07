import 'package:cyberbracy_mpt_original_front/domain/entity/calendar_entity.dart';

class CalendarModel extends CalendarEntity {
  const CalendarModel(super.dateTime, super.busy);

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      DateTime.fromMillisecondsSinceEpoch(json['localDateTimeFrom']),
      json['busy'],
    );
  }
}
