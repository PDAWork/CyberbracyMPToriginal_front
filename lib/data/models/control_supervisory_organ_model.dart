import 'package:cyberbracy_mpt_original_front/domain/entity/control_supervisory_organ_entity.dart';

class ControlSupervisoryOrganModel extends ControlSupervisoryOrganEntity {
  ControlSupervisoryOrganModel({
    required super.idTypeControl,
    required super.name,
    required super.count,
  });

  factory ControlSupervisoryOrganModel.fromJson(Map<String, dynamic> json) {
    return ControlSupervisoryOrganModel(
      name: json['name'],
      count: json['count'],
      idTypeControl: json['idTypeControl'],
    );
  }
}
