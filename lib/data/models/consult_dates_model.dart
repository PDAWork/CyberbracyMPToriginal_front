import 'package:cyberbracy_mpt_original_front/domain/entity/controls_date.dart';

class ConsultDatesModel extends ConsultDates {
  const ConsultDatesModel(super.consultDate, super.consultDateList);

  factory ConsultDatesModel.fromJson(Map<String, dynamic> json) {
    var timestamp = DateTime.fromMillisecondsSinceEpoch(json['timestamp']);
    return ConsultDatesModel(
      DateTime(timestamp.year, timestamp.month, timestamp.day),
      List<DateTime>.from(
        json["slots"].map(
          (x) => DateTime.fromMillisecondsSinceEpoch(
            x['localDateTimeFrom'],
          ),
        ),
      ),
    );
  }
}
