import 'package:cyberbracy_mpt_original_front/data/models/calendar_model.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/consult_date.dart';

class ConsultDatesModel extends ConsultDates {
  const ConsultDatesModel(super.consultDate, super.consultDateList);

  factory ConsultDatesModel.fromJson(Map<String, dynamic> json) {
    var timestamp = DateTime.fromMillisecondsSinceEpoch(json['timestamp']);
    return ConsultDatesModel(
      DateTime(timestamp.year, timestamp.month, timestamp.day),
      List<CalendarModel>.from(
        json["slots"].map(
          (x) => CalendarModel.fromJson(x),
        ),
      ),
    );
  }
}

// List<DateTime>.from(
//         json["slots"].map(
//           (x) => DateTime.fromMillisecondsSinceEpoch(
//             x['localDateTimeFrom'],
//           ),
//         ),
//       ),