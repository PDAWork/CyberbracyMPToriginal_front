import 'package:cyberbracy_mpt_original_front/domain/entity/requirements_entity.dart';

class RequirementsModel extends RequirementsEntity {
  RequirementsModel({
    required super.idRequire,
    required super.name,
    required super.typeControl,
    required super.activities,
    required super.responsibility,
    required super.idControl,
  });

  factory RequirementsModel.fromJson(Map<String, dynamic> json) {
    return RequirementsModel(
      idControl: json['idControl'],
      idRequire: json['idRequire'],
      name: json['name'],
      typeControl: json['typeControl'],
      activities: (json['activities'] as List)
          .map((e) => ActivityModel.fromJson(e))
          .toList(),
      responsibility: json['responsibility'],
    );
  }
}

class ActivityModel extends ActivityEntity {
  ActivityModel({required super.code, required super.text});

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      code: json['code'],
      text: json['text'],
    );
  }
}
