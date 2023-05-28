import 'package:cyberbracy_mpt_original_front/data/models/npas_model.dart';
import 'package:cyberbracy_mpt_original_front/data/models/requirements_model.dart';
import 'package:cyberbracy_mpt_original_front/domain/entity/requirement_body_entity.dart';

class RequirementBodyModel extends RequirementBodyEntity {
  RequirementBodyModel({
    required super.requireName,
    required super.typeOfDeyatelnostSubjectControl,
    required super.typeControl,
    required super.knoTitle,
    required super.lifetimeDocuments,
    required super.checkMethod,
    required super.fileLink,
    required super.organ,
    required super.punishType,
    required super.npasList,
    required super.activityList,
    required super.punishmentsEntity,
  });

  factory RequirementBodyModel.fromJson(Map<String, dynamic> json) {
    return RequirementBodyModel(
      requireName: json['requireName'],
      typeOfDeyatelnostSubjectControl: json['typeOfDeyatelnostSubjectControl'],
      typeControl: json['typeControl'],
      knoTitle: json['knoTitle'],
      lifetimeDocuments: json['lifetimeDocuments'],
      checkMethod: json['checkMethod'],
      fileLink: json['fileLink'],
      organ: json['organ'],
      punishType: json['punishType'],
      npasList:
          (json['npas'] as List).map((e) => NpasModel.fromJson(e)).toList(),
      activityList: (json['activities'] as List)
          .map((e) => ActivityModel.fromJson(e))
          .toList(),
      punishmentsEntity: (json['punishments'] as List).map((e) => PunishmentsModel.fromJson(e)).first
    );
  }
}

class PunishmentsModel extends PunishmentsEntity {
  PunishmentsModel({
    required super.right,
    required super.violationsList,
  });

  factory PunishmentsModel.fromJson(Map<String, dynamic> json) =>
      PunishmentsModel(
        right: json['right'],
        violationsList: (json['items'] as List)
            .map((e) => ViolationsModel.fromJson(e))
            .toList(),
      );
}

class ViolationsModel extends ViolationsEntity {
  ViolationsModel({
    required super.type,
    required super.items,
  });

  factory ViolationsModel.fromJson(Map<String, dynamic> json) =>
      ViolationsModel(
        type: json['type'],
        items:
            (json['items'] as List).map((e) => ItemModel.fromJson(e)).toList(),
      );
}

class ItemModel extends ItemEntity {
  ItemModel({
    required super.header,
    required super.amount,
    required super.vidNormy,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      header: json['header'],
      amount: json['amount'],
      vidNormy: json['vidNormy'],
    );
  }
}
