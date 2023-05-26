import '../../domain/entity/control_organ_entity.dart';

class ControlOrganModel extends ControlOrganEntity {
  ControlOrganModel({
    required super.name,
    required super.lowName,
    required super.typeControl,
    required super.requirements,
    required super.npas,
  });

  factory ControlOrganModel.fromJson(Map<String, dynamic> json) {
    return ControlOrganModel(
      name: json['name'],
      lowName: json['lowName'],
      typeControl: json['typeControls'],
      requirements: json['requirements'],
      npas: json['npas'],
    );
  }
}
